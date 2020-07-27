import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
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
}
