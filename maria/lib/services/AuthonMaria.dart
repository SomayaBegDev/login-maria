import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthonMaria {
  AuthonMaria._();
  static final AuthonMaria authonMaria = AuthonMaria._();
  FirebaseAuth fBAMaria = FirebaseAuth.instance;
  SharedPreferences spMaria;
  Future<SharedPreferences> initSPMaria() async {
    if (spMaria == null) {
      spMaria = await SharedPreferences.getInstance();
      return spMaria;
    } else {
      return spMaria;
    }
  }

  Future<String> createUserUsingEmailAndPassword(
      String email, String password) async {
    try {
      spMaria = await initSPMaria();
      AuthResult authResult = await fBAMaria.createUserWithEmailAndPassword(
          email: email, password: password);
      assert(authResult.user != null);
      String userId = authResult.user.uid;
      spMaria.setString('userId', userId);
      spMaria.setBool('isLogged', true);
      return userId;
    } catch (error) {
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
          label: "Got it",
          onPressed: () {},
        ),
      );
    }
  }

  Future<String> signInUserUsingEmailAndPassword(
      String email, String password) async {
    try {
      spMaria = await initSPMaria();
      AuthResult authResult = await fBAMaria.signInWithEmailAndPassword(
          email: email, password: password);
      assert(authResult.user != null);
      String userId = authResult.user.uid;
      spMaria.setString('userId', userId);
      spMaria.setBool('isLogged', true);
      return userId;
    } catch (error) {
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
          label: "Got it",
          onPressed: () {},
        ),
      );
    }
  }

  signOut() async {
    spMaria = await initSPMaria();
    spMaria.setBool('isLogged', false);
    spMaria.setString('userId', '');
    fBAMaria.signOut();
  }
}
