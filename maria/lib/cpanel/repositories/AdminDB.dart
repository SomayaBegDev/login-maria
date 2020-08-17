import 'dart:io';
import 'package:maria/Constant/Names.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminDB {
  AdminDB._();
  static final AdminDB adminDB = AdminDB._();
  Firestore firestoreAdmin = Firestore.instance;
  FirebaseStorage firebaseStorageAdmin = FirebaseStorage.instance;

  //Service operation
  Future<String> uploadImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorageAdmin
          .ref()
          .child('services/$dateTime.png')
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
    }
  }

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
      print(error);
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

  //Admin operation
  Future<String> addNewAdmin(Admin admin) async {
    try {
      DocumentReference docRefe =
          await firestoreAdmin.collection(adminCollname).add(admin.toJson());
      return docRefe.documentID;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  Future<List<DocumentSnapshot>> getAllAdmin() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreAdmin.collection(adminCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  editAdmin(Admin admin) async {
    try {
      firestoreAdmin
          .collection(adminCollname)
          .document(admin.documentId)
          .setData(admin.toJson());
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  deleteAdmin(String documentId) async {
    try {
      firestoreAdmin.collection(adminCollname).document(documentId).delete();
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  //booking operation

  Future<List<DocumentSnapshot>> getAllBooking() async {
    QuerySnapshot querySnapshot =
        await firestoreAdmin.collection(bookingCollname).getDocuments();
    return querySnapshot.documents;
  }
}
