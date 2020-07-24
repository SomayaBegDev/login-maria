import 'package:flutter/material.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/model/Service.dart';
import 'package:maria/cpanel/repositories/AdminDB.dart';
import 'package:maria/cpanel/repositories/AdminRep.dart';

class AdminProvider extends ChangeNotifier {
  List<Service> allServices = [];
  String ServiceName;
  bool isAvailable = true;
  double fee;

  setServiceName(String sName) {
    this.ServiceName = sName;
  }

  setFee(String sFee) {
    this.fee = double.parse(sFee);
  }

  Future<bool> addNewService() async {
    Service service = Service(name: this.ServiceName, fee: this.fee);
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
      mySnackBar(error: error);
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
}
