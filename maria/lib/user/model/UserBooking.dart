import 'package:cloud_firestore/cloud_firestore.dart';

class UserBooking {
  String documentId;
  String userNmae;
  String staffName;
  String service;
  String imageUrl;
  DateTime date;
  String time;
  int confirmation;

  UserBooking(
      {this.documentId,
      this.userNmae,
      this.staffName,
      this.service,
      this.imageUrl,
      this.date,
      this.time,
      this.confirmation});
  UserBooking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.userNmae = docSnapShot.data['userNmae'];
    this.service = docSnapShot.data['service'];
    this.imageUrl = docSnapShot.data['imageUrl'];
    this.staffName = docSnapShot.data['staffName'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.confirmation = docSnapShot.data['confirmation'];
  }
  toJson() {
    return {
      'userNmae': this.userNmae,
      'service': this.service,
      'imageUrl': this.imageUrl,
      'staffName': this.staffName,
      'date': this.date,
      'time': this.time,
      'confirmation': this.confirmation
    };
  }
}
