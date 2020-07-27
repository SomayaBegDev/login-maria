import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String documentId;
  String userID;
  String staffID;
  String serviceID;
  String date;
  String time;
  String confirmation;

  Booking(
      {this.documentId,
      this.userID,
      this.staffID,
      this.serviceID,
      this.date,
      this.time,
      this.confirmation});
  Booking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.userID = docSnapShot.data['userID'];
    this.serviceID = docSnapShot.data['serviceID'];
    this.staffID = docSnapShot.data['staffID'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.confirmation = docSnapShot.data['confirmation'];
  }
  toJson() {
    return {
      'userId': this.userID,
      'serviceId': this.serviceID,
      'staffId': this.staffID,
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
