import 'package:closingwork/screens/loginscr.dart';
import 'package:closingwork/screens/opencamera.dart';
import 'package:flutter/material.dart';

void main() => runApp(CloseWorkApp());

class CloseWorkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.black),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => CloseWorkPage(),
        '/main': (context) => CameraPage()
      },
    );
  }
}

class CloseWorkPage extends StatefulWidget {
  @override
  CloseWorkPageState createState() => CloseWorkPageState();  
}

class CloseWorkPageState extends State<CloseWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CloseWorkLogin(
        backgroundColor1: Colors.black,
        backgroundColor2: Colors.black,
        foregroundColor: Colors.white,
        highlightColor: Colors.green,
      ),
    );
  }
}
