import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final currentUser = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade400,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Center(child: Text("Your signed in " + currentUser.email!)),
    );
  }
}