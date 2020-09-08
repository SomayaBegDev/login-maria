import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Booking.dart';
import 'package:maria/cpanel/model/Category.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'AdminDB.dart';

class AdminRep {
  AdminRep._();
  static AdminRep adminRep = AdminRep._();

  //Category section

  Future<List<Category>> getAllCategories() async {
    try {
      List<DocumentSnapshot> documents =
          await AdminDB.adminDB.getAllCategories();

      List<Category> categories =
          documents.map((e) => Category.fromDocumetSnapshot(e)).toList();

      return categories;
    } catch (error) {
      print(error);
    }
  }

  //Service section

  Future<List<Service>> getAllServices(Category category) async {
    try {
      List<DocumentSnapshot> documents =
          await AdminDB.adminDB.getAllServices(category);

      List<Service> service =
          documents.map((e) => Service.fromDocumetSnapshot(e)).toList();

      return service;
    } catch (error) {
      print(error);
    }
  }

  //Staff section
  Future<List<Staff>> getAllStaff() async {
    try {
      List<DocumentSnapshot> documents = await AdminDB.adminDB.getAllStaff();

      List<Staff> staff =
          documents.map((e) => Staff.fromDocumetSnapshot(e)).toList();

      return staff;
    } catch (error) {
      print(error);
    }
  }

  //Admin section
  Future<List<Admin>> getAllAdmin() async {
    try {
      List<DocumentSnapshot> documents = await AdminDB.adminDB.getAllAdmin();

      List<Admin> admin =
          documents.map((e) => Admin.fromDocumetSnapshot(e)).toList();

      return admin;
    } catch (error) {
      print(error);
    }
  }

  //booking section

  Future<List<Booking>> getAllBooking() async {
    try {
      List<DocumentSnapshot> docs = await AdminDB.adminDB.getAllBooking();
      List<Booking> allBooking =
          docs.map((e) => Booking.fromDocumetSnapshot(e)).toList();
      return allBooking;
    } catch (e) {
      print("${e}");
    }
  }
}
