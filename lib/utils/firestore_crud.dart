import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreMethods {
  static FirebaseFirestore db = FirebaseFirestore.instance;

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

  static Future<void> readDataFromFirestore(String collectionName) async {
    await db.collection(collectionName).get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          //return doc.data();
        });
      },
    );
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
}
