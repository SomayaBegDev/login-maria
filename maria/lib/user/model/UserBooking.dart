import 'package:cloud_firestore/cloud_firestore.dart';

class UserBooking {
  String documentId;
  String username;
  String staffname;
  String service;
  String imageUrl;
  dynamic date;
  String time;
  int confirmation;

  UserBooking(
      {this.documentId,
      this.username,
      this.staffname,
      this.service,
      this.imageUrl,
      this.date,
      this.time,
      this.confirmation});

  UserBooking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.username = docSnapShot.data['username'];
    this.service = docSnapShot.data['service'];
    this.imageUrl = docSnapShot.data['imageUrl'];
    this.staffname = docSnapShot.data['staffname'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.confirmation = docSnapShot.data['confirmation'];
  }
  toJson() {
    return {
      'username': this.username,
      'service': this.service,
      'imageUrl': this.imageUrl,
      'staffname': this.staffname,
      'date': this.date,
      'time': this.time,
      'confirmation': this.confirmation
    };
  }
}
