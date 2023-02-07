import 'package:fitness_app/constants/navigation.dart';
import 'package:fitness_app/screens/signup_screen.dart';
import 'package:fitness_app/utils/firestore_crud.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/constants/global.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                        child: Center(
                      child: Image.asset(
                        "assets/images/login.jpg",
                      ),
                    )),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: const Text(
                      "Please Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 35),
                    child: SizedBox(
                      height: 55,
                      width: 350,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 229, 229),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 81, 74, 74),
                                blurRadius: 15.0,
                                offset: Offset(0, 5),
                                spreadRadius: 0.3,
                              ),
                            ],
                            border: Border.all(
                              width: 1.2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                18,
                              ),
                            )),
                        child: Row(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  width: 320,
                                  child: TextFormField(
                                    controller: emailController,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your Email here',
                                      suffixIcon: Icon(
                                        Icons.email_outlined,
                                        size: 25.0,
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 35),
                    child: SizedBox(
                      height: 55,
                      width: 350,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 229, 229),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 81, 74, 74),
                                blurRadius: 15.0,
                                offset: Offset(0, 5),
                                spreadRadius: 0.3,
                              ),
                            ],
                            border: Border.all(
                              width: 1.2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                18,
                              ),
                            )),
                        child: Row(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  width: 320,
                                  child: TextFormField(
                                    obscureText: isVisible,
                                    controller: passwordController,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'password',
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            isVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            size: 25.0,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 250),
                    child: Text(
                      "forgot password?",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 45, top: 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize:
                                const Size(100, 40), // Background color
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 40),
                        child: const Text(
                          "( or )",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize:
                                const Size(100, 40), // Background color
                          ),
                          onPressed: () {
                            logInToFb();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logInToFb() {
    firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) async {
      globals.userdoc = result.user!.uid;
      await FireStoreMethods.getDetails("Users", globals.userdoc);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RootApp(uid: result.user!.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
