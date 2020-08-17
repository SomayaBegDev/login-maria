import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String documentId;
  String username;
  String staffname;
  String service;
  dynamic date;
  String time;
  int confirmation;

  Booking(
      {this.documentId,
      this.username,
      this.staffname,
      this.service,
      this.date,
      this.time,
      this.confirmation});
  Booking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.username = docSnapShot.data['username'];
    this.service = docSnapShot.data['service'];
    this.staffname = docSnapShot.data['staffname'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.confirmation = docSnapShot.data['confirmation'];
  }
  toJson() {
    return {
      'username': this.username,
      'service': this.service,
      'staffname': this.staffname,
      'date': this.date,
      'time': this.time,
      'confirmation': this.confirmation
    };
  }
}
