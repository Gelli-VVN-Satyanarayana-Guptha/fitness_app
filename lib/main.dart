import 'package:fitness_app/screens/splash_screen.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:fitness_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants/navigation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fitness community app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/Navigation',
      //initialRoute: '/SignUpScreen',
      routes: {
      //  "/": (context) => SplashScreen(),
      //  '/LoginScreen': (context) => LoginScreen(),
        // '/HomeScreen': (context) => HomeScreen(),
        '/Navigation' :(context) => Navigation(),
      //  '/SignUpScreen': (context) => SignUpScreen(),
      },
    );
  }
}
