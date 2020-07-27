import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String documentId;
  String userId;
  String serviceId;
  String staffId;
  String date;
  String time;
  String statues;

  Booking({
    this.documentId,
    this.userId,
    this.serviceId,
    this.staffId,
    this.date,
    this.time,
    this.statues,
  });
  Booking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.userId = docSnapShot.data['userId'];
    this.serviceId = docSnapShot.data['serviceId'];
    this.staffId = docSnapShot.data['staffId'];
    this.date = docSnapShot.data['date'];
    this.time = docSnapShot.data['time'];
    this.statues = docSnapShot.data['statues'];
  }
  toJson() {
    return {
      'userId': this.userId,
      'serviceId': this.serviceId,
      'staffId': this.staffId,
      'date': this.date,
      'time': this.time,
      'statues': this.statues
    };
  }
}
