import 'package:flutter/material.dart';
import 'package:fitness_app/screens/home_screen.dart';
import "package:fitness_app/screens/profile.dart";
class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    Center(child: Text('feed', style: TextStyle(fontSize: 60),),),
    Center(child: Text('chat', style: TextStyle(fontSize: 60),),),
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() =>  currentIndex = index),
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', 
            
           ),
            BottomNavigationBarItem(  
            icon: Icon(Icons.groups),
            label: 'Feed', 
            
           ),
            BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat', 
          
           ),
        ],
           
    ));
  }
}