import 'dart:io';
import 'package:maria/Constant/Names.dart';
import 'package:maria/user/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';

class UserFB {
  UserFB._();
  static final UserFB userFB = UserFB._();
  Firestore firestoreUser = Firestore.instance;

  //User operation
  Future<String> addNewUser(User user) async {
    try {
      DocumentReference docRefe =
          await firestoreUser.collection(userCollname).add(user.toJson());
      return docRefe.documentID;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  Future<List<DocumentSnapshot>> getAllServices() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreUser.collection(serviceCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  Future<List<DocumentSnapshot>> getAllStaff() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreUser.collection(staffCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  Future<List<DocumentSnapshot>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreUser.collection(userCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      mySnackBar(error: error);
    }
  }
}
