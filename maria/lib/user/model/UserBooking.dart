import 'package:cloud_firestore/cloud_firestore.dart';

class UserBooking {
  String documentId;
  String userNmae;
  String staffName;
  String service;
  DateTime date;
  String time;
  int confirmation;

  UserBooking(
      {this.documentId,
      this.userNmae,
      this.staffName,
      this.service,
      this.date,
      this.time,
      this.confirmation});
  UserBooking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.userNmae = docSnapShot.data['userNmae'];
    this.service = docSnapShot.data['service'];
    this.staffName = docSnapShot.data['staffName'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.confirmation = docSnapShot.data['confirmation'];
  }
  toJson() {
    return {
      'userNmae': this.userNmae,
      'service': this.service,
      'staffName': this.staffName,
      'date': this.date,
      'time': this.time,
      'confirmation': this.confirmation
    };
  }
}

/*class UserBooking {
  String userID;
  String staffID;
  String serviceID;
  String date;
  String time;
  String confirmation;
  UserBooking(
      {this.userID,
      this.staffID,
      this.serviceID,
      this.date,
      this.time,
      this.confirmation});
  UserBooking.fromMap(Map<String, dynamic> map) {
    this.userID = map['userID'];
    this.staffID = map['staffID'];
    this.serviceID = map['serviceID'];
    this.date = map['date'];
    this.time = map['time'];
    this.confirmation = map['confirmation'];
  }
  toJson() {
    return {
      'serviceID': this.serviceID,
      'staffID': this.staffID,
      'date': this.date,
      'staffID': this.staffID,
      'staffID': this.staffID,
    };
  }
}
*/
