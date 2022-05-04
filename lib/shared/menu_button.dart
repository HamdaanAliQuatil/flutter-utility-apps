// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_declarations

import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 2) {
            final diameter = 200.0;
            final iconSize = 40;
            showDialog(
              context: context,
              barrierDismissible: true,
              barrierColor: Colors.grey.withOpacity(0.1),
              builder: (context) => Material(
                color: Colors.transparent,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: diameter + iconSize,
                      height: diameter / 1.5,
                      alignment: Alignment.bottomCenter,
                      margin:
                          EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                      child: Stack(
                        children: [
                          Container(
                              alignment: Alignment.bottomCenter,
                              child: MyArc(diameter: diameter)),
                          Positioned(
                            left: 0,
                            bottom: 10,
                            child: _buildButton(),
                          ),
                          Positioned(
                            left: diameter / 4,
                            top: 10,
                            child: _buildButton(),
                          ),
                          Positioned(
                            right: diameter / 4,
                            top: 10,
                            child: _buildButton(),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 10,
                            child: _buildButton(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        items: List<BottomNavigationBarItem>.generate(
          5,
          (index) =>
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ),
      ),
    );
  }

  _buildButton() {
    return Container(
      constraints: BoxConstraints.tightFor(width: 40, height: 60),
      child: Column(
        children: [
          Text(
            'Title',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 3),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({Key key, this.diameter = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.blue,
          Colors.purpleAccent.withOpacity(0.4),
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height),
        radius: 200,
      ));
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        height: size.height * 1.5,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


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
