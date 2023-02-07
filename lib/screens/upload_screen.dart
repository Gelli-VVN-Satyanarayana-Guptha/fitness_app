import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:fitness_app/utils/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants/global.dart' as globals;

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  ImageUpload IU = ImageUpload();
  final CollectionReference myPosts =
      FirebaseFirestore.instance.collection(globals.userdoc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff502F2F),
        title: const Text(
          'Upload Post',
          style: TextStyle(fontFamily: "inder"),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                setState((() => {}));
              }),
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: myPosts.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: SizedBox(
                                height: 30,
                                width: 40,
                                child:
                                    Image.network(documentSnapshot["postimg"])),
                            title: Text(globals.username),
                            trailing: IconButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {
                                String postDoc = documentSnapshot["postDoc"];

                                String dShid = documentSnapshot.id;
                                String imgid = documentSnapshot["postimg"];
                                //FireStoreMethods.deletePost(postDoc,dShid,imgid);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 39, 39),
                        // Background color
                      ),
                      onPressed: () {
                        setState(() async {
                          await IU.upload('camera', '/postimg');
                        });
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text('Camera')),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 39, 39),
                        // Background color
                      ),
                      onPressed: () {
                        setState(() async {
                          await IU.upload('gallery', '/postimg');
                        });
                      },
                      icon: const Icon(Icons.library_add),
                      label: const Text('Gallery')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
