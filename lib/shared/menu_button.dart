// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_declarations

import 'dart:math' as math;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(       
      onTap: (int index){
        switch (index) {
          case 0: Navigator.pushNamed(context, '/');
                  break;
          case 1: Navigator.pushNamed(context, '/scan');
                  break;
          case 2: Navigator.pushNamed(context, '/weather');
                  break;
          case 3: Navigator.pushNamed(context, '/sessions_screen');
                  break;
        }
      },                                                      
      type: BottomNavigationBarType.fixed, 
      backgroundColor: Colors.deepOrange,
      selectedItemColor: Colors.greenAccent,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'BMI',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Weather',
        ),
        BottomNavigationBarItem( //import icons how to search
          icon: Icon(Icons.person),
          label: 'Training',
        ),
    ],
    );
  }
}
// class MyArc extends StatelessWidget {
//   final double diameter;

//   const MyArc({Key? key, this.diameter = 200}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

// import "package:flutter/material.dart";

// class MenuButton extends StatelessWidget {
//   const MenuButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       onTap: (int index){
//         switch (index) {
//           case 0: Navigator.pushNamed(context, '/');
//                   break;
//           case 1: Navigator.pushNamed(context, '/scan');
//                   break;
//         }
//       },
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.deepOrange,
//       selectedItemColor: Colors.greenAccent,
//       unselectedItemColor: Colors.grey,

//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.dashboard),
//           label: 'Dashboard',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.camera_alt),
//           label: 'Scan',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: 'Settings',
//         ),
//         BottomNavigationBarItem( //import icons how to search
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//     ],
//     );
//     // return Scaffold(
//   }
// }
