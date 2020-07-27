import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/Constant/Names.dart';
import 'package:maria/user/model/Booking.dart';

class UserFB {
  UserFB._();
  static final UserFB userFB = UserFB._();
  Firestore firestoreUser = Firestore.instance;

  Future<String> addNewBooking(Booking booking) async {
    try {
      DocumentReference documentReference =
          await firestoreUser.collection(bookingCollname).add(booking.toJson());
      return documentReference.documentID;
    } catch (error) {
      print(error);
    }
  }

  editBooking(Booking booking) async {
    try {
      firestoreUser
          .collection(bookingCollname)
          .document(booking.documentId)
          .setData(booking.toJson());
    } catch (error) {
      mySnackBar(error: error);
    }
  }

  deleteBooking(String documentId) async {
    try {
      firestoreUser.collection(bookingCollname).document(documentId).delete();
    } catch (error) {
      mySnackBar(error: error);
    }
  }
}
