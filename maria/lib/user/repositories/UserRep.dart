import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/model/UserCategory.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/User.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'UserFB.dart';

class UserRep {
  UserRep._();
  static UserRep userRep = UserRep._();
  //User section
  Future<List<User>> getAllUse() async {
    try {
      List<DocumentSnapshot> documents = await UserFB.userFB.getAllUsers();

      List<User> users =
          documents.map((e) => User.fromDocumetSnapshot(e)).toList();

      return users;
    } catch (error) {
      print(error);
    }
  }
  //Category section

  Future<List<UserCategory>> getAllCategories() async {
    try {
      List<DocumentSnapshot> documents = await UserFB.userFB.getAllCategories();

      List<UserCategory> categories =
          documents.map((e) => UserCategory.fromDocumetSnapshot(e)).toList();

      return categories;
    } catch (error) {
      print(error);
    }
  }

  //service section
  Future<List<UserService>> getAllServices(UserCategory category) async {
    try {
      List<DocumentSnapshot> documents =
          await UserFB.userFB.getAllServices(category);

      List<UserService> service =
          documents.map((e) => UserService.fromDocumetSnapshot(e)).toList();

      return service;
    } catch (error) {
      print(error);
    }
  }

  //staff section
  Future<List<UserStaff>> getAllStaff() async {
    try {
      List<DocumentSnapshot> documents = await UserFB.userFB.getAllStaff();

      List<UserStaff> staff =
          documents.map((e) => UserStaff.fromDocumetSnapshot(e)).toList();

      return staff;
    } catch (error) {
      print(error);
    }
  }

  //booking section

  Future<List<UserBooking>> getAllBooking() async {
    try {
      List<DocumentSnapshot> docs = await UserFB.userFB.getAllBooking();
      List<UserBooking> allBooking =
          docs.map((e) => UserBooking.fromDocumetSnapshot(e)).toList();
      return allBooking;
    } catch (e) {
      print("${e}");
    }
  }
}
