import 'package:cloud_firestore/cloud_firestore.dart';

class Staff {
  String documentId;
  String staffname;
  String email;
  String password;

  Staff({
    this.staffname,
    this.documentId,
    this.email,
    this.password,
  });
  Staff.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.staffname = docSnapShot.data['username'];
    this.email = docSnapShot.data['email'];
    this.password = docSnapShot.data['password'];
  }
  toJson() {
    return {
      'username': this.staffname,
    };
  }
}
