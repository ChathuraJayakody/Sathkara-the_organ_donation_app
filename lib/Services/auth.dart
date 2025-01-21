import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organ_donation_app/Models/UserModel.dart';
import 'package:organ_donation_app/users/loginPage.dart';

class AuthServices {
  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Hive box for storing login details
  final _authBox = Hive.box('authBox');

  // Create a user from Firebase user with UID
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Stream for checking auth changes
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // Save login details to Hive
  void saveLoginDetails(String uid, String? email) {
    _authBox.put('uid', uid);
    _authBox.put('email', email);
  }

  // Clear login details from Hive
  void clearLoginDetails() {
    _authBox.clear();
  }

  // Sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      if (user != null) {
        saveLoginDetails(user.uid, null); // No email for anonymous login
      }

      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Register using email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        saveLoginDetails(user.uid, user.email);
      }

      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Sign in using email and password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        saveLoginDetails(user.uid, user.email);
      }

      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Clear login details and navigate to Login Page
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      _authBox.clear(); // Clear Hive data

      // Navigate to Login Page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Loginpage()),
        (route) => false,
      );
    } catch (err) {
      print("Error signing out: ${err.toString()}");
    }
  }
}
