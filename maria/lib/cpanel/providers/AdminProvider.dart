import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/repositories/AdminDB.dart';
import 'package:maria/cpanel/repositories/AdminRep.dart';
import 'package:maria/cpanel/model/Staff.dart';

class AdminProvider extends ChangeNotifier {
  //Service Section
  List<Service> allServices = [];
  String ServiceName;
  double fee;
  String imageUrl;

  setServiceName(String sName) {
    this.ServiceName = sName;
  }

  setFee(String sFee) {
    this.fee = double.parse(sFee);
  }

  uploadImage(File imageFile) async {
    String imageUrl = await AdminDB.adminDB.uploadImage(imageFile);
    this.imageUrl = imageUrl;
    print(imageUrl);
    notifyListeners();
  }

  Future<bool> addNewService() async {
    Service service =
        Service(name: this.ServiceName, fee: this.fee, imageUrl: this.imageUrl);
    String serviceId = await AdminDB.adminDB.addNewService(service);
    if (serviceId != null) {
      getAllServices();
      return true;
    } else {
      return false;
    }
  }

  getAllServices() async {
    try {
      List<Service> services = await AdminRep.adminRep.getAllServices();
      this.allServices = services;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  deleteService(String documentId) async {
    await AdminDB.adminDB.deleteService(documentId);
    getAllServices();
  }

  editService(Service service) async {
    await AdminDB.adminDB.editService(service);
    getAllServices();
  }

  //Staff Section
  List<Staff> allStaff = [];
  String staffName;
  String staffEmail;
  String staffPassword;

  setStaffName(String stName) {
    this.staffName = stName;
  }

  setStaffEmail(String stEmail) {
    this.staffEmail = stEmail;
  }

  setStaffPassword(String stPassword) {
    this.staffPassword = stPassword;
  }

  Future<bool> addNewStaff() async {
    Staff staff = Staff(
        staffname: this.staffName,
        email: this.staffEmail,
        password: this.staffPassword);
    String staffId = await AdminDB.adminDB.addNewStaff(staff);
    if (staffId != null) {
      getAllStaff();
      return true;
    } else {
      return false;
    }
  }

  getAllStaff() async {
    try {
      List<Staff> staff = await AdminRep.adminRep.getAllStaff();
      this.allStaff = staff;
      notifyListeners();
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  deleteStaff(String documentId) async {
    await AdminDB.adminDB.deleteStaff(documentId);
    getAllStaff();
  }

  editStaff(Staff staff) async {
    await AdminDB.adminDB.editStaff(staff);
    getAllStaff();
  }
}
