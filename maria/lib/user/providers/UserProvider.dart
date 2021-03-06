import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/Constant/Names.dart';
import 'package:maria/user/model/User.dart';
import 'package:maria/user/model/UserCategory.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'package:maria/user/model/UserBooking.dart';
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
    String userId = await UserFB.userFB.addNewUser(user);
    if (userId != null) {
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
      print(error);
    }
  }

  //Category Section
  List<UserCategory> allCategories = [];
  List<UserService> services = [];

  setAllCategories(List<UserCategory> categories) {
    this.allCategories = categories;
  }

  getAllCategories() async {
    try {
      List<UserCategory> categories = await UserRep.userRep.getAllCategories();
      this.allCategories = categories;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //service section
  List<UserService> allServices = [];
  getAllServices(UserCategory category) async {
    try {
      List<UserService> services =
          await UserRep.userRep.getAllServices(category);
      this.allServices = services;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //staff Section
  List<UserStaff> allStaff = [];
  getAllStaff() async {
    try {
      List<UserStaff> staff = await UserRep.userRep.getAllStaff();
      this.allStaff = staff;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //booking section

  List<UserBooking> allUserBooking = [];

  String staffName;
  String category;
  String service;
  String imageUrl;
  var date = "";
  var time = "";
  String comment = "";
  double evaluation = 0.0;

  int confirmation;

  setStaffName(String stName) {
    this.staffName = stName;
  }

  setCategory(String category) {
    this.category = category;
  }

  setService(String aService) {
    this.service = aService;
  }

  setImageURL(String imURL) {
    this.imageUrl = imURL;
  }

  setDate(var date) {
    this.date = date;
  }

  setTime(var time) {
    this.time = time;
  }

  setConfirmation(int conf) {
    this.confirmation = conf;
  }

  setComment(String comment) {
    this.comment = comment;
  }

  setEvaluation(double evaluation) {
    this.evaluation = evaluation;
  }

  Future<bool> addNewBooking() async {
    UserBooking userBooking = UserBooking(
        username: this.userName,
        staffname: this.staffName,
        category: this.category,
        service: this.service,
        imageUrl: this.imageUrl,
        date: this.date,
        time: this.time,
        confirmation: this.confirmation,
        comment: this.comment,
        evaluation: this.evaluation);
    String bookingId = await UserFB.userFB.addNewBooking(userBooking);
    if (bookingId != null) {
      getAllUserBooking();
      return true;
    } else {
      return false;
    }
  }

  deleteBooking(String documentId) async {
    await UserFB.userFB.deleteBooking(documentId);

    getAllUserBooking();
  }

  updateBooking(UserBooking userBooking, String documentId) async {
    try {
      await UserFB.userFB.updateBooking(documentId, userBooking.toJson());
    } catch (e) {
      print(e);
    }
  }

  getAllUserBooking() async {
    try {
      List<UserBooking> usBook = await UserRep.userRep.getAllBooking();
      this.allUserBooking = usBook;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
