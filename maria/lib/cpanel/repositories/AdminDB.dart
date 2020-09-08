import 'dart:io';
import 'package:maria/Constant/Names.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Category.dart';
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

  //Category operation

  Future<String> uploadCategoryImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorageAdmin
          .ref()
          .child('categories/$dateTime.png')
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
    }
  }

  Future<String> addNewCategory(Category category) async {
    try {
      DocumentReference docRefe = await firestoreAdmin
          .collection(categoryCollname)
          .add(category.toJson());
      return docRefe.documentID;
    } catch (error) {
      print(error);
    }
  }

//getAllCategories()
  Future<List<DocumentSnapshot>> getAllCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreAdmin.collection(categoryCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  editCategory(String documentId, Map category) async {
    try {
      await firestoreAdmin
          .collection(categoryCollname)
          .document(documentId)
          .updateData(category);
    } catch (error) {
      print(error);
    }
  }

  deleteCategory(String documentId) async {
    try {
      firestoreAdmin.collection(categoryCollname).document(documentId).delete();
    } catch (error) {
      print(error);
    }
  }

  //Service operation
  Future<String> uploadImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorageAdmin
          .ref()
          .child('categories/services/$dateTime.png')
          .putFile(file)
          .onComplete;

      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
    }
  }

  Future<String> addNewService(Service service, Category category) async {
    try {
      DocumentReference docRefe = await firestoreAdmin
          .collection(categoryCollname)
          .document(category.documentId)
          .collection(serviceCollname)
          .add(service.toJson());
      return docRefe.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllServices(Category category) async {
    try {
      QuerySnapshot querySnapshot = await firestoreAdmin
          .collection(categoryCollname)
          .document(category.documentId)
          .collection(serviceCollname)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  editService(String docId, Map service, Category category) async {
    try {
      await firestoreAdmin
          .collection(categoryCollname)
          .document(category.documentId)
          .collection(serviceCollname)
          .document(docId)
          .updateData(service);
    } catch (error) {
      print(error);
    }
  }

  deleteService(String documentId, Category category) async {
    try {
      firestoreAdmin
          .collection(categoryCollname)
          .document(category.documentId)
          .collection(serviceCollname)
          .document(documentId)
          .delete();
    } catch (error) {
      print(error);
    }
  }

  //Staff operation
  Future<String> addNewStaff(Staff staff) async {
    try {
      DocumentReference docRefe =
          await firestoreAdmin.collection(staffCollname).add(staff.toJson());
      return docRefe.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllStaff() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreAdmin.collection(staffCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  editStaff(String documentId, Map staff) async {
    try {
      await firestoreAdmin
          .collection(staffCollname)
          .document(documentId)
          .updateData(staff);
    } catch (error) {
      print(error);
    }
  }

  deleteStaff(String documentId) async {
    try {
      firestoreAdmin.collection(staffCollname).document(documentId).delete();
    } catch (error) {
      print(error);
    }
  }

  //Admin operation
  Future<String> addNewAdmin(Admin admin) async {
    try {
      DocumentReference docRefe =
          await firestoreAdmin.collection(adminCollname).add(admin.toJson());
      return docRefe.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllAdmin() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreAdmin.collection(adminCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  editAdmin(Admin admin) async {
    try {
      firestoreAdmin
          .collection(adminCollname)
          .document(admin.documentId)
          .setData(admin.toJson());
    } catch (error) {
      print(error);
    }
  }

  deleteAdmin(String documentId) async {
    try {
      firestoreAdmin.collection(adminCollname).document(documentId).delete();
    } catch (error) {
      print(error);
    }
  }

  //booking operation

  Future<List<DocumentSnapshot>> getAllBooking() async {
    QuerySnapshot querySnapshot =
        await firestoreAdmin.collection(bookingCollname).getDocuments();
    return querySnapshot.documents;
  }
}
