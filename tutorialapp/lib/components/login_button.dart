import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color: Colors.amber),
        child: Center(
          child: Text('Login', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          )
        ),
      ),
    );
  }
}