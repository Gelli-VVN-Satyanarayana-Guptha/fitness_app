import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    child: Center(
                      child: Image.asset(
                        "assets/images/signup.jpg",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 0),
                  child: Center(
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 25),
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
                        ),
                      ),
                      child: Row(children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                width: 320,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Username',
                                    suffixIcon: Icon(
                                      Icons.account_circle_rounded,
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
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Full Name',
                                    suffixIcon: Icon(
                                      Icons.account_circle_rounded,
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
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email address',
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
                                  obscureText: true,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'password',
                                      suffixIcon: Icon(Icons.remove_red_eye,
                                          size: 25.0,
                                          color:
                                              Colors.black.withOpacity(0.8))),
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
                  padding: const EdgeInsets.only(left: 150, top: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(70, 40), // Background color
                    ),
                    onPressed: () => {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
