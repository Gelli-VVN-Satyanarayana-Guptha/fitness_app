import 'dart:ui';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: TextStyle(fontFamily: 'inder')),
      backgroundColor: Color(0xff502F2F),

      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
        )
        ),
    );
  }
}