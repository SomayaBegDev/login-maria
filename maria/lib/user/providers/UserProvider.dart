import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/user/model/User.dart';
import 'package:maria/user/repositories/UserFB.dart';
import 'package:maria/user/repositories/UserRep.dart';

class UserProvider extends ChangeNotifier {
  //User Section
  List<User> allUsers = [];
  String userName;
  String userEmail;
  String userPassword;

  setUserName(String uName) {
    this.userName = uName;
  }

  setUserEmail(String uEmail) {
    this.userEmail = uEmail;
  }

  setUserPassword(String uPassword) {
    this.userPassword = uPassword;
  }

  Future<bool> addNewUser() async {
    User user = User(
        username: this.userName,
        email: this.userEmail,
        password: this.userPassword);
    String staffId = await UserFB.userFB.addNewUser(user);
    if (staffId != null) {
      getAllUser();
      return true;
    } else {
      return false;
    }
  }

  getAllUser() async {
    try {
      List<User> users = await UserRep.userRep.getAllUse();
      this.allUsers = users;
      notifyListeners();
    } catch (error) {
      mySnackBar(error: error);
    }
  }
}
