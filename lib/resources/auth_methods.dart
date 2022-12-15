import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_flutter/utils/utils.dart';

class AuthMethods {
  // ♦ Private Properties
  //   → for I nitializing Firebase and Firestore:
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ♦ Getters → for Accessing "Private Properties":
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  // ♦ The "signInWithGoogle()" Method:
  Future<bool> signInWithGoogle(BuildContext context) async {
    // ♦ The "Result" of the "Function":
    bool res = false;

    try {
      // ♦ Create "Google User" and its "Sign In":
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // ♦ Getting the "Google User Authentication":
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // ♦ Getting "Google User Credential"
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // ♦ Creating "User Credential":
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // ♦ Creating "User":
      User? user = userCredential.user;

      // ♦ Checking: If "there is an User":
      if (user != null) {
        // ♦ Checking: If "is a New User":
        if (userCredential.additionalUserInfo!.isNewUser) {
          // ♦ Storing "User" in the "Database":
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        // ♦ The "Result" of the "Function":
        res = true;
      }

      // ♦ Catching "All Exceptions" from "Firebase Auth":
    } on FirebaseAuthException catch (e) {
      // ♦ Displaying the "SnackBar Message":
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }
}
