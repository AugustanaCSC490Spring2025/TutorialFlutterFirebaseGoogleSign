import 'package:flutter/material.dart';
import 'package:testing/components/login_button.dart';
import 'package:testing/components/login_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //login method
  void loginUser() {}
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
          child: Column(
            children: [
              //Sign In Text
              Text(
                "Let's get you signed in",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                width: 150,

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

              LoginButton(onTap: loginUser),

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
              Container(
                child: Image.asset('lib/images/google_logo.png', height: 75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
