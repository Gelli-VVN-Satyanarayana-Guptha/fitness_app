import 'package:fitness_app/screens/splash_screen.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:fitness_app/screens/signup_screen.dart';
import 'package:fitness_app/screens/feed_screen.dart';
import 'package:fitness_app/screens/chat_screen.dart';
import 'package:fitness_app/constants/navigation.dart';
import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fitness_app/constants/global.dart' as globals;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
