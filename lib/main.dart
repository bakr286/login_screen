import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/loginScreen.dart';


bool _isDarkTheme=false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Login Screen',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home:  LoginScreen()
    );
  }
}






