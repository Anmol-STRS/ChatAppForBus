import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('The email address is already in use.');
      } else {
        log('An error occurred: ${e.code}');
      }
    }
    return null;
  }
  Future<bool> checkUserExists(String email) async {
    try {
      // Use FirebaseAuth's built-in method to check if the user exists
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: '',
      );
      await userCredential.user?.delete();
      return true;
    } catch (error) {
      // If there's an error, return false
      return false;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        log('Invalid email or password.');
      } else {
        log('An error occurred: ${e.code}');
      }
    }
    return null;
  }
}
