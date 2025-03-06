import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorialapp/components/login_button.dart';
import 'package:tutorialapp/components/login_textfield.dart';
import 'package:tutorialapp/service/google_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //login method
  void loginUser() async {
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text, 
        password: passwordController.text,
      );
    }on FirebaseAuthException catch(e){
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String errorMessage){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.lightGreenAccent.shade400,
          title: Center(
            child: Text(
              errorMessage,
            ),
          ),
        );
      }
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
                  "Let's get you signed in",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  width: 100,
                
                  //STRYKE ICON?
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://media.istockphoto.com/id/1031419850/vector/fist-male-hand-proletarian-protest-symbol-power-sign.jpg?s=612x612&w=0&k=20&c=Ku4vLrr3AwLczsqVnsJ9UGvXI5gos50eVm6KIPD9xhY=',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                ),
                
                //USERNAME TEXTFIELD
                const SizedBox(height: 25),
                
                LoginTextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                
                //PASSWORD TEXTFIELD
                const SizedBox(height: 25),
                
                LoginTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                
                //FORGOT PASSWORD
                const SizedBox(height: 15),
                
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Forgot Password?')],
                  ),
                ),
                
                //LOGIN BUTTON
                const SizedBox(height: 25),
                
                LoginButton(
                  onTap: loginUser,
                  buttonText: 'Login',
                ),
                
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
                    child: Image.asset('lib/images/google_logo.png', height: 75),
                  ),
                ),
                
                //REGISTER NOW 
                SizedBox(height: 10, width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
