// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class NavigationDrawer extends StatefulWidget {
//   const NavigationDrawer({super.key});

//   @override
//   State<NavigationDrawer> createState() => _NavigationDrawerState();
// }

// class _NavigationDrawerState extends State<NavigationDrawer> {

//   final CollectionReference post = FirebaseFirestore.instance.collection('Users');
//   final name = 
//   @override
//   Widget build(BuildContext context) {
//     return (Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountEmail: Text(name),
//             accountName: Text(email),
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 208, 214, 218),
//             ),
//           ),
//           ListTile(
//             leading: new IconButton(
//               icon: new Icon(Icons.home, color: Colors.black),
//               onPressed: () => null,
//             ),
//             title: Text('Home'),
//             onTap: () {
//               print(widget.uid);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
//               );
//             },
//           ),
//           ListTile(
//             leading: new IconButton(
//               icon: new Icon(Icons.settings, color: Colors.black),
//               onPressed: () => null,
//             ),
//             title: Text('Settings'),
//             onTap: () {
//               print(widget.uid);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => SettingsRoute(uid: widget.uid)),
//               );
//             },
//           ),
//         ],
//       ),
//     ));
//   }
// }
