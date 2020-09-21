import 'dart:io';
import 'package:maria/Constant/Names.dart';
import 'package:maria/user/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/model/UserCategory.dart';

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
      print(error);
    }
  }

  //category operation
  Future<List<DocumentSnapshot>> getAllCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreUser.collection(categoryCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }
  //services operation

  Future<List<DocumentSnapshot>> getAllServices(UserCategory category) async {
    try {
      QuerySnapshot querySnapshot = await firestoreUser
          .collection(categoryCollname)
          .document(category.documentId)
          .collection(serviceCollname)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllStaff() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreUser.collection(staffCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreUser.collection(userCollname).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  //booking operation
  Future<String> addNewBooking(UserBooking booking) async {
    try {
      DocumentReference docRefe =
          await firestoreUser.collection(bookingCollname).add(booking.toJson());
      return docRefe.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllBooking() async {
    QuerySnapshot querySnapshot =
        await firestoreUser.collection(bookingCollname).getDocuments();
    return querySnapshot.documents;
  }

  deleteBooking(String documentId) async {
    try {
      firestoreUser.collection(bookingCollname).document(documentId).delete();
    } catch (error) {
      print(error);
    }
  }

  updateBooking(String documentId, Map booking) async {
    try {
      await firestoreUser
          .collection(bookingCollname)
          .document(documentId)
          .updateData(booking);
    } catch (e) {
      print(e);
    }
  }
}
