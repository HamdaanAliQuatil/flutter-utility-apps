// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:footer_mgnregs/screens/weather_screen.dart';
import '../screens/dashboard.dart';
import '../screens/intro_screen.dart';
import '../screens/sessions_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
        children: buildMenuItems(context),
      ),
    );
     
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Dashboard',
      'Scan',
      'Weather',
      'Training',
      'Calendar',
      'Create Task',
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.deepOrange),
        child: Text(
          'MNREGS',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(
            element,
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = Scan();
                break;               
              case 'Dashboard':
                screen = Dashboard();
                break; 
              case 'Weather':
                screen = WeatherScreen();
                break; 
              case 'Training':
                screen = SessionsScreen();
                break; 
            }
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen
          ));  
          }));
    });
    return menuItems;
  }
}
