import 'package:flutter/material.dart';
import 'package:tutorialapp/pages/auth_page.dart';
import 'package:tutorialapp/pages/login_page.dart';

void main(){
  runApp(testApp());
}

class testApp extends StatelessWidget {
  const testApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign-In',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: AuthPage(),
    );
  }
}