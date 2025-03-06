import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/components/login_button.dart';
import 'package:tutorialapp/components/login_textfield.dart';
import 'package:tutorialapp/service/google_auth.dart';
import 'package:tutorialapp/components/login_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //register method
  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: usernameController.text,
              password: passwordController.text,
            );
      } else {
        showErrorMessage("Passwords don't match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.lightGreenAccent.shade400,
          title: Center(child: Text(errorMessage)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      //App Bar
      appBar: AppBar(
        title: Text('Google Sign-In'),
        backgroundColor: Colors.amber.shade600,
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Sign In Text
                Text(
                  "Let's get you signed up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                //STRYKE ICON?
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://media.istockphoto.com/id/1031419850/vector/fist-male-hand-proletarian-protest-symbol-power-sign.jpg?s=612x612&w=0&k=20&c=Ku4vLrr3AwLczsqVnsJ9UGvXI5gos50eVm6KIPD9xhY=',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                //USERNAME TEXTFIELD
                const SizedBox(height: 15),

                LoginTextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                //PASSWORD TEXTFIELD
                const SizedBox(height: 15),

                LoginTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                //CONFIRM PASSWORD
                const SizedBox(height: 15),

                LoginTextfield(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                //LOGIN BUTTON
                const SizedBox(height: 25),

                LoginButton(onTap: registerUser, buttonText: 'Register'),

                //LOGIN WITH OTHER OPTIONS
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black)),

                    Text('or continue with'),

                    Expanded(child: Divider(color: Colors.black)),
                  ],
                ),

                //GOOGLE BUTTON
                GestureDetector(
                  onTap: GoogleAuth().googleSign,
                  child: Container(
                    child: Image.asset(
                      'lib/images/google_logo.png',
                      height: 75,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),

                //REGISTER NOW
                SizedBox(height: 10, width: 4),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}