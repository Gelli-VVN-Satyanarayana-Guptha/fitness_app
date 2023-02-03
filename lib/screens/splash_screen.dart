import 'package:fitness_app/constants/navigation.dart';
import 'package:fitness_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  User? result = FirebaseAuth.instance.currentUser;

  void initState() {
    Future.delayed(
        Duration(seconds: 3),
        () => (result != null)
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RootApp()),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              "assets/images/logo.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
