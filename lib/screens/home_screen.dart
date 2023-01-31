import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final username = "Satya";
  final motivationline = "\"No Pain No Gain\"";
  final hrate = "76";
  final timer = "00 : 00";

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Hello $username", style: TextStyle(fontFamily: 'inder')),
          backgroundColor: Color(0xff502F2F),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              onPressed: () {},
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
                                              child: Text(timer,
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
                                            child: Image.asset(
                                                "assets/images/timer.png"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70, top: 0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          minimumSize: const Size(
                                              60, 20), // Background color
                                        ),
                                        onPressed: () => {},
                                        child: const Text(
                                          "Start",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
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
                                              child: Text(timer,
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
                                            child: Image.asset(
                                                "assets/images/timer.png"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70, top: 0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          minimumSize: const Size(
                                              60, 20), // Background color
                                        ),
                                        onPressed: () => {},
                                        child: const Text(
                                          "Start",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
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
                                              child: Text(timer,
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
                                            child: Image.asset(
                                                "assets/images/timer.png"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70, top: 0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          minimumSize: const Size(
                                              60, 20), // Background color
                                        ),
                                        onPressed: () => {},
                                        child: const Text(
                                          "Start",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
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
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(0, 119, 119, 173),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(children: []),
            )
          ]),
        ),
      )),
    );
  }
}
