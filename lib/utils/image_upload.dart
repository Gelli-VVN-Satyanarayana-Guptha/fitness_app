import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:fitness_app/constants/global.dart' as globals;

class ImageUpload {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> upload(String inputSource, String folderName) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        var file =
            await storage.ref().child(folderName).child(fileName).putFile(
                imageFile,
                SettableMetadata(customMetadata: {
                  'uploaded_by': globals.username,
                }));
        final String fileUrl = await file.ref.getDownloadURL();
        if (folderName == "/postimg") {
          Map<String, dynamic> data = {
            "name": globals.username,
            "img": globals.imgString,
            "like": 0,
            "postimg": fileUrl,
          };
          String postDoc =
              await FireStoreMethods.addDataToFirestore("posts", data);
          Map<String, dynamic> myPost = {
            "postimg": fileUrl,
            "postDoc": postDoc
          };
          FireStoreMethods.addDataToFirestore(globals.userdoc, myPost);
        } else {
          FireStoreMethods.updateOneField(
              "Users", "img", globals.userdoc, fileUrl);
        }
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<List<Map<String, dynamic>>> loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().child("/postimg").list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
      });
    });

    return files;
  }

  Future<void> delete(String ref) async {
    await storage.ref(ref).delete();
  }
}
