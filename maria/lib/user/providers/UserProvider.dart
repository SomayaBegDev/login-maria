import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/Constant/Names.dart';
import 'package:maria/user/model/User.dart';
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
      mySnackBar(error: error);
    }
  }

  //service section
  List<UserService> allServices = [];
  getAllServices() async {
    try {
      List<UserService> services = await UserRep.userRep.getAllServices();
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
      mySnackBar(error: error);
    }
  }

  //booking section
  List<UserBooking> allBooking = [];
  List<UserBooking> bookingForAllUser = [];
  String staffName;
  String service;
  DateTime date;
  String time;
  int confirmation;

  setStaffName(String stName) {
    this.staffName = stName;
  }

  setService(String aService) {
    this.service = aService;
  }

  setDate(DateTime date) {
    this.date = date;
  }

  setTime(String time) {
    this.time = time;
  }

  setConfirmation(int conf) {
    this.confirmation = conf;
  }

  Future<bool> addNewBooking() async {
    UserBooking userBooking = UserBooking(
        userNmae: this.userName,
        staffName: this.staffName,
        service: this.service,
        date: this.date,
        time: this.time,
        confirmation: this.confirmation);
    String bookingId = await UserFB.userFB.addNewBookinf(userBooking);
    if (bookingId != null) {
      getAllUser();
      return true;
    } else {
      return false;
    }
  }

  deleteBooking(String documentId) async {
    await UserFB.userFB.deleteBooking(documentId);
    getAllBooking();
    getBookingForAllUser();
  }

  getAllBooking() async {
    try {
      List<UserBooking> userBooking = await UserRep.userRep.getAllBooking();

      for (int i = 0; i < userBooking.length; i++) {
        if (userBooking[i].userNmae == this.userName) {
          this.allBooking = userBooking;
          notifyListeners();
        }
      }
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  getBookingForAllUser() async {
    try {
      List<UserBooking> allUsersBooking = await UserRep.userRep.getAllBooking();
      this.bookingForAllUser = allUsersBooking;
      notifyListeners();
    } catch (error) {
      mySnackBar(error: error);
    }
  }
}
