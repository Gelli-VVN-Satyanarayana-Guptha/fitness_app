import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitness_app/data/post_json.dart';
import 'package:fitness_app/data/user_json.dart';
import 'package:fitness_app/utils/image_upload.dart';
import 'package:fitness_app/constants/global.dart' as globals;

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  var pressed = List<int>.filled(100, 0);
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');
  ImageUpload IU = ImageUpload();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Community", style: TextStyle(fontFamily: 'inder')),
          backgroundColor: Color(0xff502F2F),
          actions: <Widget>[
            IconButton(
              icon: const Icon(CupertinoIcons.bell),
              onPressed: () {},
            ),
          ]),
      body: getBody(),
    );
  }

  Widget getBody() {
    return StreamBuilder(
        stream: posts.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Feed",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFFFE0DF),
                                      Color(0xFFE1F6F4)
                                    ])),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                    onPressed: () {
                                      IU.upload('gallery', '/postimg');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Row(
                                children: List.generate(
                                    streamSnapshot.data!.docs.length, (index) {
                                  final DocumentSnapshot documentSnapshot =
                                      streamSnapshot.data!.docs[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  documentSnapshot["img"]),
                                              fit: BoxFit.cover)),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: List.generate(streamSnapshot.data!.docs.length,
                          (index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        final String doc = documentSnapshot.id;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 288,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: Offset(0, 1))
                                    ],
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            documentSnapshot['postimg']),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 288,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.25))),
                              Container(
                                width: double.infinity,
                                height: 288,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    documentSnapshot['img']
                                                        .toString()),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    documentSnapshot['name'],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              width: 70,
                                              height: 27,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Color(0xFFE5E5E5)
                                                      .withOpacity(0.5)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        pressed[index] = 1;

                                                        FireStoreMethods
                                                            .updateOneField(
                                                                "posts",
                                                                doc,
                                                                "like",
                                                                documentSnapshot[
                                                                        "like"] +
                                                                    1);
                                                      });
                                                    },
                                                    child: Icon(
                                                      (pressed[index] == 0)
                                                          ? CupertinoIcons.heart
                                                          : CupertinoIcons
                                                              .heart_fill,
                                                      size: 18,
                                                      color: pressed[index] == 0
                                                          ? Color.fromARGB(255,
                                                              255, 255, 255)
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                  Text(
                                                    documentSnapshot['like']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
