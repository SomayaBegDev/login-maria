import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String documentId;
  String username;
  String email;
  String password;

  User({
    this.username,
    this.documentId,
    this.email,
    this.password,
  });
  User.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.username = docSnapShot.data['username'];
    this.email = docSnapShot.data['email'];
    this.password = docSnapShot.data['password'];
  }
  toJson() {
    return {
      'username': this.username,
    };
  }
}
