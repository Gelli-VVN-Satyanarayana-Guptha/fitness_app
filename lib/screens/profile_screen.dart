import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:fitness_app/utils/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/data/me_post_json.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:fitness_app/constants/global.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImageUpload IU = ImageUpload();
  bool isPhoto = true;
  final username = globals.username;
  final email = globals.email;
  final jogtime = globals.minJ;
  final cycletime = globals.minC;
  final yogatime = globals.minY;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("My Profile", style: TextStyle(fontFamily: 'inder')),
          backgroundColor: Color(0xff502F2F),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Color.fromARGB(255, 225, 223, 216),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Center(
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          image: DecorationImage(
                              image: NetworkImage(globals.imgString),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 225,
                    child: IconButton(
                        onPressed: (() async {
                          await IU.upload("gallery", "/userimg");
                          setState(() {});
                        }),
                        icon: Icon(
                          Icons.photo_camera,
                          color: Colors.black,
                          size: 30,
                        )),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "$username",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "$email",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Jogging",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$jogtime",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "minutes",
                    style: TextStyle(fontSize: 8, color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Cycling",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$cycletime",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "minutes",
                    style: TextStyle(fontSize: 8, color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Yoga",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$yogatime",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "minutes",
                    style: TextStyle(fontSize: 8, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "My Posts",
            style: TextStyle(
                fontFamily: "inder", fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: List.generate(mePostList.length, (index) {
                return Container(
                  width: (size.width - 60) / 2,
                  height: (size.width - 60) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(mePostList[index]),
                          fit: BoxFit.cover)),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
