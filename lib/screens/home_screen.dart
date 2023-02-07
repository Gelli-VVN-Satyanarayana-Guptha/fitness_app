import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/screens/profile_screen.dart';
import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants/global.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final username = globals.username;
  final hrate = "76";

  Timer? countTimerJ;
  Timer? countTimerC;
  Timer? countTimerY;
  Duration myDurationJ = Duration(hours: 1);
  Duration myDurationC = Duration(hours: 1);
  Duration myDurationY = Duration(hours: 1);
  @override
  void initState() {
    super.initState();
  }

  void startTimer(String activity) {
    switch (activity) {
      case "J":
        countTimerJ =
            Timer.periodic(Duration(seconds: 1), (_) => setCount("J"));
        break;
      case "C":
        countTimerC =
            Timer.periodic(Duration(seconds: 1), (_) => setCount("C"));
        break;
      case "Y":
        countTimerY =
            Timer.periodic(Duration(seconds: 1), (_) => setCount("Y"));
        break;
    }
  }

  void stopTimer(String activity) {
    switch (activity) {
      case "J":
        setState(() => countTimerJ!.cancel());
        break;
      case "C":
        setState(() => countTimerC!.cancel());
        break;
      case "Y":
        setState(() => countTimerY!.cancel());
        break;
    }
  }

  void resetTimer(String activity) {
    stopTimer(activity);
    switch (activity) {
      case "J":
        setState(() => myDurationJ = Duration(hours: 1));
        break;
      case "C":
        setState(() => myDurationC = Duration(hours: 1));
        break;
      case "Y":
        setState(() => myDurationY = Duration(hours: 1));
        break;
    }
  }

  void setCount(String activity) {
    final increaseSecondsBy = 1;

    switch (activity) {
      case "J":
        setState(() {
          final secondsJ = myDurationJ.inSeconds + increaseSecondsBy;
          myDurationJ = Duration(seconds: secondsJ);
        });
        break;
      case "C":
        setState(() {
          final secondsC = myDurationC.inSeconds + increaseSecondsBy;
          myDurationC = Duration(seconds: secondsC);
        });
        break;
      case "Y":
        setState(() {
          final secondsY = myDurationY.inSeconds + increaseSecondsBy;
          myDurationY = Duration(seconds: secondsY);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutesJ = strDigits(myDurationJ.inMinutes.remainder(60));
    final secondsJ = strDigits(myDurationJ.inSeconds.remainder(60));
    final minutesC = strDigits(myDurationC.inMinutes.remainder(60));
    final secondsC = strDigits(myDurationC.inSeconds.remainder(60));
    final minutesY = strDigits(myDurationY.inMinutes.remainder(60));
    final secondsY = strDigits(myDurationY.inSeconds.remainder(60));

    globals.minJ = minutesJ;
    globals.minC = minutesC;
    globals.minY = minutesY;

    return Scaffold(
      appBar: AppBar(
          title: Text("Hello $username", style: TextStyle(fontFamily: 'inder')),
          backgroundColor: Color(0xff502F2F),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                signOut();
              },
            ),
          ]),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 68),
                    border: Border.all(width: 0.8, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Heart Rate",
                              style: TextStyle(
                                  fontFamily: "inder",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 10),
                          child: Text("$hrate bpm",
                              style: TextStyle(
                                  fontFamily: "inder",
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 100, right: 20, top: 20, bottom: 20),
                      child: Image.asset("assets/images/heart.png"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38),
                  child: Container(
                    width: 160,
                    height: 160,
                    child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, bottom: 0, left: 15),
                        child: Text(
                          "Diet",
                          style: TextStyle(
                              fontFamily: "inder",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 10,
                            bottom: 15,
                          ),
                          child: SizedBox(
                            height: 55,
                            width: 45,
                            child: GestureDetector(
                                onTap: () {
                                  print("diet");
                                },
                                child: Image.asset("assets/images/diet.png")),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, bottom: 0, left: 15),
                        child: Text(
                          "Exercise",
                          style: TextStyle(
                              fontFamily: "inder",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 15),
                          child: SizedBox(
                            height: 55,
                            width: 45,
                            child: GestureDetector(
                                onTap: () {
                                  print("exercise");
                                },
                                child:
                                    Image.asset("assets/images/exercise.png")),
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            )),
            Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffEDE2E2),
                        borderRadius: BorderRadius.all((Radius.circular(10)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Text("Activity Monitor",
                              style: TextStyle(
                                  fontFamily: "inder",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 162, 162, 162),
                                borderRadius:
                                    BorderRadius.all((Radius.circular(10)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 237, 232, 232),
                                                border: Border.all(
                                                    width: 0.8,
                                                    color: Color.fromARGB(
                                                        255, 44, 23, 23)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                  "$minutesJ : $secondsJ",
                                                  style: TextStyle(
                                                      fontFamily: "inder",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            top: 25,
                                          ),
                                          child: SizedBox(
                                            height: 55,
                                            width: 45,
                                            child: GestureDetector(
                                              onTap: () {
                                                resetTimer("J");
                                              },
                                              child: Image.asset(
                                                  "assets/images/timer.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: const Size(
                                                  60, 20), // Background color
                                            ),
                                            onPressed: () {
                                              startTimer("J");
                                            },
                                            child: const Text(
                                              "start",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: const Size(
                                                  60, 20), // Background color
                                            ),
                                            onPressed: () {
                                              if (countTimerJ == null ||
                                                  countTimerJ!.isActive) {
                                                stopTimer("J");
                                              }
                                            },
                                            child: const Text(
                                              "stop",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, top: 20, bottom: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: SizedBox(
                                        height: 100,
                                        width: 90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              "assets/images/marathon.png"),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 162, 162, 162),
                                borderRadius:
                                    BorderRadius.all((Radius.circular(10)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 237, 232, 232),
                                                border: Border.all(
                                                    width: 0.8,
                                                    color: Color.fromARGB(
                                                        255, 44, 23, 23)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                  "$minutesC : $secondsC",
                                                  style: TextStyle(
                                                      fontFamily: "inder",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            top: 25,
                                          ),
                                          child: SizedBox(
                                            height: 55,
                                            width: 45,
                                            child: GestureDetector(
                                              onTap: () {
                                                resetTimer("C");
                                              },
                                              child: Image.asset(
                                                  "assets/images/timer.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: const Size(
                                                  60, 20), // Background color
                                            ),
                                            onPressed: () {
                                              startTimer("C");
                                            },
                                            child: const Text(
                                              "start",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: const Size(
                                                  60, 20), // Background color
                                            ),
                                            onPressed: () {
                                              if (countTimerC == null ||
                                                  countTimerC!.isActive) {
                                                stopTimer("C");
                                              }
                                            },
                                            child: const Text(
                                              "stop",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, top: 20, bottom: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: SizedBox(
                                        height: 100,
                                        width: 90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              "assets/images/cycling.png"),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 162, 162, 162),
                                borderRadius:
                                    BorderRadius.all((Radius.circular(10)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 237, 232, 232),
                                                border: Border.all(
                                                    width: 0.8,
                                                    color: Color.fromARGB(
                                                        255, 44, 23, 23)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                  "$minutesY : $secondsY",
                                                  style: TextStyle(
                                                      fontFamily: "inder",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            top: 25,
                                          ),
                                          child: SizedBox(
                                            height: 55,
                                            width: 45,
                                            child: GestureDetector(
                                              onTap: (() {
                                                resetTimer("Y");
                                              }),
                                              child: Image.asset(
                                                  "assets/images/timer.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: const Size(
                                                  60, 20), // Background color
                                            ),
                                            onPressed: () {
                                              startTimer("Y");
                                            },
                                            child: const Text(
                                              "start",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: const Size(
                                                  60, 20), // Background color
                                            ),
                                            onPressed: () {
                                              if (countTimerY == null ||
                                                  countTimerY!.isActive) {
                                                stopTimer("Y");
                                              }
                                            },
                                            child: const Text(
                                              "stop",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, top: 20, bottom: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: SizedBox(
                                        height: 100,
                                        width: 90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              "assets/images/guru.png"),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ), //container
              ]),
            ),
          ]),
        ),
      )),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
