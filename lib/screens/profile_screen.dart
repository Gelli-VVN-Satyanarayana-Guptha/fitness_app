import 'package:flutter/material.dart';
import 'package:fitness_app/data/me_post_json.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPhoto = true;
  final username = "Satya";
  final email = "@satyanarayana";
  final jogtime = 20;
  final cycletime = 10;
  final yogatime = 15;

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
              icon: const Icon(Icons.arrow_circle_left_outlined),
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
            height: 200,
            color: Colors.amber.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 41,
                    left: 38,
                    child: IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.photo_camera,
                          color: Colors.black,
                          size: 20,
                        )),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "$username",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
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
