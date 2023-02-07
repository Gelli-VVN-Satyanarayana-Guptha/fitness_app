import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/chat_screen.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:fitness_app/screens/feed_screen.dart';
import 'package:fitness_app/screens/profile_screen.dart';
import 'package:fitness_app/constants/global.dart' as globals;

import 'dart:math' as math;

import '../screens/upload_screen.dart';

class RootApp extends StatefulWidget {
  const RootApp({
    Key? key,
    String? uid,
  }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    FireStoreMethods.getDetails("Users", globals.userdoc);
    return Scaffold(
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomeScreen(),
        FeedScreen(),
        UploadScreen(),
        MembersScreen(),
        ProfileScreen(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 1)),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 0;
                    });
                  },
                  child: Icon(
                    Icons.home,
                    size: 25,
                    color: activeTab == 0 ? Colors.blue : Colors.black,
                  ),
                ),
                SizedBox(
                  width: 55,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 1;
                    });
                  },
                  child: Icon(
                    Icons.amp_stories,
                    size: 25,
                    color: activeTab == 1 ? Colors.blue : Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                    });
                  },
                  child: Icon(
                    Icons.groups,
                    size: 25,
                    color: activeTab == 3 ? Colors.blue : Colors.black,
                  ),
                ),
                SizedBox(
                  width: 55,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 4;
                    });
                  },
                  child: Icon(
                    Icons.account_circle,
                    size: 28,
                    color: activeTab == 4 ? Colors.blue : Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getFloatingButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = 2;
        });
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 1)),
          ], color: Colors.black, borderRadius: BorderRadius.circular(23)),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
                child: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
              size: 26,
            )),
          ),
        ),
      ),
    );
  }
}
