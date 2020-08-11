import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  String documentId;
  String adminname;
  String email;
  String password;

  Admin({
    this.adminname,
    this.documentId,
    this.email,
    this.password,
  });
  Admin.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.adminname = docSnapShot.data['username'];
    this.email = docSnapShot.data['email'];
    this.password = docSnapShot.data['password'];
  }
  toJson() {
    return {
      'username': this.adminname,
      'email': this.email,
      'password': this.password
    };
  }
}
