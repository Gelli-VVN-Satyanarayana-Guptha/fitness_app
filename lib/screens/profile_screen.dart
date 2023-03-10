import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:fitness_app/utils/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:fitness_app/constants/global.dart' as globals;
import 'package:fitness_app/providers/userdata_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImageUpload IU = ImageUpload();

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
                          await IU.upload(
                              'gallery',
                              '/userimg',
                              globals.username,
                              globals.imgString,
                              globals.userdoc);

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
                    globals.username,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  globals.email,
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
                    Provider.of<UserDataProvider>(context, listen: false).jog,
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
                    Provider.of<UserDataProvider>(context, listen: false).cycle,
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
                    Provider.of<UserDataProvider>(context, listen: false).yoga,
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
        ],
      ),
    );
  }
}
