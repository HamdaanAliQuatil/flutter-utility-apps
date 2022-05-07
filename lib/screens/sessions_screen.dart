// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:footer_mgnregs/data/sp_helper.dart';
import '../data/http_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({ Key? key }) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
   helper.init().then((value) {updateScreen();});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions'),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showSessionDialog(context);
        },
      ) ,
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async{
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Insert Training Session'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(hintText: 'Description'),
                  ),
                TextField(
                  controller: txtDuration,
                  decoration: InputDecoration(hintText: 'Duration'),
                  ),
                ],
              ),
            ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.pop(context);
                txtDescription.text = '';
                txtDuration.text = '';
              }),
            ElevatedButton(
              onPressed: saveSession, 
              child: Text('Save'),
              ),
          ],
        );
      }
      );
  }

  Future saveSession() async{
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    Session newSession = Session(1, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writeSession(newSession);
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent(){
    List<Widget> tiles = [];
    sessions.forEach((session) { 
      tiles.add(ListTile(
        title: Text(session.description),
        subtitle: Text('${session.date} - duration: ${session.duration} min'),
      ));
    });
    return tiles;
  }

  void updateScreen(){
    sessions = helper.getSessions();
    setState(() {
      
    });
  }
}