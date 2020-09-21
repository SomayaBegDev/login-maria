import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserBooking {
  String documentId;
  String username;
  String staffname;
  String category;
  String service;
  String imageUrl;
  var date;
  var time;
  int confirmation;
  String comment;
  double evaluation;

  UserBooking(
      {this.documentId,
      this.username,
      this.staffname,
      this.category,
      this.service,
      this.imageUrl,
      this.date,
      this.time,
      this.confirmation,
      this.comment,
      this.evaluation});

  UserBooking.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.username = docSnapShot.data['username'];
    this.category = docSnapShot.data['category'];
    this.service = docSnapShot.data['service'];
    this.imageUrl = docSnapShot.data['imageUrl'];
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
      'category': this.category,
      'service': this.service,
      'imageUrl': this.imageUrl,
      'staffname': this.staffname,
      'date': this.date,
      'time': this.time,
      'confirmation': this.confirmation,
      'comment': this.comment,
      'evaluation': this.evaluation
    };
  }
}
