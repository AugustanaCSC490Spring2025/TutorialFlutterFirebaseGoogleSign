import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  //GOOGLE SIGN IN
  googleSign() async{
    //pull up interactive google sign in
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //get auth details
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //create user credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}