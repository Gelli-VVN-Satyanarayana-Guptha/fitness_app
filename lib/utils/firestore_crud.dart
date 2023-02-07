import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/utils/image_upload.dart';
import 'package:fitness_app/constants/global.dart' as globals;

class FireStoreMethods {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static ImageUpload IU = ImageUpload();

  static Future<String> addDataToFirestore(
      String collectionName, Map<String, dynamic> data) async {
    late String response;
    await db
        .collection(collectionName)
        .add(data)
        .then(
          (DocumentReference doc) => {response = doc.id},
        )
        .catchError((onError) => {response = onError.toString()});

    return response;
  }

  static Future<void> addUserDoc(
      String collectionName, String docid, Map<String, dynamic> data) async {
    await db
        .collection(collectionName)
        .doc(docid)
        .set(data)
        .catchError((onError) => {print(onError.toString())});
  }

  static Future<String> readDataFromFirestore(
      String collectionName, String docid) async {
    var docSh = await db.collection(collectionName).doc(docid).get();
    Map<String, dynamic>? data = docSh.data();
    print(data);
    String postDoc = data!["postimg"];
    return postDoc;
  }

  static Future<void> updateOrCreateFirestoreData(
      String id, String collectionName, Map<String, dynamic> data,
      {bool isMerge = false}) async {
    await db
        .collection(collectionName)
        .doc(id)
        .set(data, SetOptions(merge: isMerge));
  }

  static Future<void> deleteData(String id, String collectionName) async {
    await db
        .collection(collectionName)
        .doc(id)
        .delete()
        .then((value) => print("Deleted"));
  }

  static Future<void> updateOneField(
      String collectionName, String field, String docid, dynamic data) async {
    await db
        .collection(collectionName)
        .doc(docid)
        .update({field: data}).catchError((e) => print(e));
  }

  static Future<void> getDetails(String collectionName, String docid) async {
    var docSh = await db.collection(collectionName).doc(docid).get();
    Map<String, dynamic>? data = docSh.data();
    globals.imgString = data?["img"];
    globals.username = data?["username"];
    globals.email = data?["email"];
  }

  static Future<void> deletePost(
      String postDoc, String dShid, String imgid) async {
    await FireStoreMethods.deleteData(postDoc, "posts");
    await FireStoreMethods.deleteData(postDoc, globals.userdoc);
    await FireStoreMethods.deleteData(dShid, globals.userdoc);
    await IU.delete(imgid);
  }
}
