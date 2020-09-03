import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String documentId;
  String username;
  String staffname;
  String service;
  var date;
  var time;
  int confirmation;
  String comment;
  double evaluation;

  Booking(
      {this.documentId,
      this.username,
      this.staffname,
      this.service,
      this.date,
      this.time,
      this.confirmation,
      this.comment,
      this.evaluation});
  Booking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.username = docSnapShot.data['username'];
    this.service = docSnapShot.data['service'];
    this.staffname = docSnapShot.data['staffname'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.confirmation = docSnapShot.data['confirmation'];
    this.comment = docSnapShot.data['comment'];
    this.evaluation = docSnapShot.data['evaluation'];
  }
  toJson() {
    return {
      'username': this.username,
      'service': this.service,
      'staffname': this.staffname,
      'date': this.date,
      'time': this.time,
      'confirmation': this.confirmation,
      'comment': this.comment,
      'evaluation': this.evaluation
    };
  }
}
