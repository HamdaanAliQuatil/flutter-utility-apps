// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:footer_mgnregs/shared/menu_drawer.dart';
import '../shared/menu_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.all(78.0),
        child: const Text("Utility App",
        style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuButton(),
        
    
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/download.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
            ),
            child: const Text(
              'Collection of utility applications',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0,
                    color: Colors.red,
                  ),
                ],
              ),
              ),
          ),
        ),
      ),
    );     
  }
}

