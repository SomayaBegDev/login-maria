import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Booking.dart';
import 'package:maria/cpanel/model/Category.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/repositories/AdminDB.dart';
import 'package:maria/cpanel/repositories/AdminRep.dart';
import 'package:maria/cpanel/model/Staff.dart';

class AdminProvider extends ChangeNotifier {
  //Category Section
  List<Category> allCategories = [];
  List<Service> services = [];
  String categoryName;
  String categoryImageUrl;

  setAllCategories(List<Category> categories) {
    this.allCategories = categories;
  }

  setCategoryName(String categName) {
    this.categoryName = categName;
  }

  setCategoryImageURL(String url) {
    this.categoryImageUrl = url;
  }

  uploadCategoryImage(File imageFile) async {
    String imageUrl = await AdminDB.adminDB.uploadCategoryImage(imageFile);
    this.categoryImageUrl = imageUrl;
    print(imageUrl);
    notifyListeners();
  }

  Future<bool> addNewCategory() async {
    Category category = Category(
      name: this.categoryName,
      imageUrl: this.categoryImageUrl,
    );
    String categoryId = await AdminDB.adminDB.addNewCategory(category);
    if (categoryId != null) {
      getAllCategories();
      return true;
    } else {
      return false;
    }
  }

  getAllCategories() async {
    try {
      List<Category> categories = await AdminRep.adminRep.getAllCategories();
      this.allCategories = categories;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  deleteCategory(String documentId) async {
    await AdminDB.adminDB.deleteCategory(documentId);
    getAllCategories();
  }

  editCategory(Category category, String documentId) async {
    try {
      await AdminDB.adminDB.editCategory(documentId, category.toJson());
    } catch (e) {
      print(e);
    }
  }

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

  Future<bool> addNewService(Category category) async {
    Service service =
        Service(name: this.ServiceName, fee: this.fee, imageUrl: this.imageUrl);
    String serviceId = await AdminDB.adminDB.addNewService(service, category);
    if (serviceId != null) {
      getAllServices(category);
      return true;
    } else {
      return false;
    }
  }

  getAllServices(Category category) async {
    try {
      List<Service> services = await AdminRep.adminRep.getAllServices(category);
      this.allServices = services;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  deleteService(String documentId, Category category) async {
    await AdminDB.adminDB.deleteService(documentId, category);
    getAllServices(category);
  }

  editService(Service service, String documentId, Category category) async {
    try {
      await AdminDB.adminDB.editService(documentId, service.toJson(), category);
    } catch (e) {
      print(e);
    }
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
      print(error);
    }
  }

  deleteStaff(String documentId) async {
    await AdminDB.adminDB.deleteStaff(documentId);
    getAllStaff();
  }

  editStaff(Staff staff, String documentId) async {
    try {
      await AdminDB.adminDB.editStaff(documentId, staff.toJson());
    } catch (e) {
      print(e);
    }
  }

  //Admin section
  List<Admin> allAdmin = [];
  String adminName;
  String adminEmail;
  String adminPassword;

  setAdminName(String adminName) {
    this.adminName = adminName;
  }

  setAdminEmail(String adminEmail) {
    this.adminEmail = adminEmail;
  }

  setAdminPassword(String adminPassword) {
    this.adminPassword = adminPassword;
  }

  Future<bool> addNewAdmin() async {
    Admin admin = Admin(
        adminname: this.adminName,
        email: this.adminEmail,
        password: this.adminPassword);
    String adminId = await AdminDB.adminDB.addNewAdmin(admin);
    if (adminId != null) {
      getAllAdmin();
      return true;
    } else {
      return false;
    }
  }

  getAllAdmin() async {
    try {
      List<Admin> admin = await AdminRep.adminRep.getAllAdmin();
      this.allAdmin = admin;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  deleteAdmin(String documentId) async {
    await AdminDB.adminDB.deleteAdmin(documentId);
    getAllAdmin();
  }

  editAdmin(Admin admin) async {
    await AdminDB.adminDB.editAdmin(admin);
    getAllAdmin();
  }

  //booking section
  List<Booking> allUserBooking = [];
  getAllUserBooking() async {
    try {
      List<Booking> usBook = await AdminRep.adminRep.getAllBooking();
      this.allUserBooking = usBook;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
