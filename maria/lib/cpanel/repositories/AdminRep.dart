import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Booking.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'AdminDB.dart';

class AdminRep {
  AdminRep._();
  static AdminRep adminRep = AdminRep._();

  //Service section

  Future<List<Service>> getAllServices() async {
    try {
      List<DocumentSnapshot> documents = await AdminDB.adminDB.getAllServices();

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
      mySnackBar(error: error);
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
      mySnackBar(error: error);
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
