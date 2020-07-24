import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:maria/Constant/Names.dart';
import 'package:maria/model/Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/model/Staff.dart';

class AdminDB {
  AdminDB._();
  static final AdminDB adminDB = AdminDB._();
  Firestore firestoreAdmin = Firestore.instance;

  //Service operation
  Future<String> addNewService(Service service) async {
    try {
      DocumentReference docRefe = await firestoreAdmin
          .collection(serviceCollname)
          .add(service.toJson());
      return docRefe.documentID;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  Future<List<DocumentSnapshot>> getAllServices() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreAdmin.collection(serviceCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  editService(Service service) async {
    try {
      firestoreAdmin
          .collection(serviceCollname)
          .document(service.documentId)
          .setData(service.toJson());
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  deleteService(String documentId) async {
    try {
      firestoreAdmin.collection(serviceCollname).document(documentId).delete();
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  //Staff operation
  Future<String> addNewStaff(Staff staff) async {
    try {
      DocumentReference docRefe =
          await firestoreAdmin.collection(staffCollname).add(staff.toJson());
      return docRefe.documentID;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  Future<List<DocumentSnapshot>> getAllStaff() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreAdmin.collection(staffCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  editStaff(Staff staff) async {
    try {
      firestoreAdmin
          .collection(staffCollname)
          .document(staff.documentId)
          .setData(staff.toJson());
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  deleteStaff(String documentId) async {
    try {
      firestoreAdmin.collection(staffCollname).document(documentId).delete();
    } catch (error) {
      mySnackBar(error: error);
    }
  }
}
