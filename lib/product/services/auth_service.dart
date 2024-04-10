import 'package:api/features/authentication/sign_in/sign_in_page.dart';
import 'package:api/features/main_page/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class IAuthenticationService {
  Future<void> signIn(BuildContext context,
      {required String email, required String password});
  Future<void> signUp(BuildContext context,
      {required String name,
      required String lastname,
      required String email,
      required String password});
  Future<void> signOut(BuildContext context);
}

class AuthenticationService extends IAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> signUp(BuildContext context,
      {required String name,
      required String lastname,
      required String email,
      required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(
            name: name, lastname: lastname, email: email, password: password);
        navigator.push(MaterialPageRoute(
          builder: (context) => const MainPage(),
        ));
      }
    } on FirebaseAuthException catch (e) {
      Text(e.message.toString());
    }
  }

  @override
  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        navigator.push(MaterialPageRoute(
          builder: (context) => const MainPage(),
        ));
      }
    } on FirebaseAuthException catch (e) {
      Text(e.message.toString());
    }
  }

  @override
  Future<void> signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    await _firebaseAuth.signOut();
    navigator.pushReplacement(
      MaterialPageRoute(builder: (context) =>  SignInPage()),
    );
  }

  Future<void> _registerUser(
      {required String name,
      required String lastname,
      required String email,
      required String password}) async {
    await userCollection.doc().set({
      "name": name,
      "lastname": lastname,
      "email": email,
      "password": password
    });
  }
}
