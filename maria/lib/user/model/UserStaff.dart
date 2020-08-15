//UserStaff
import 'package:cloud_firestore/cloud_firestore.dart';

class UserStaff {
  String staffname;
  String documentId;
  UserStaff({this.staffname, this.documentId});
  UserStaff.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.staffname = docSnapShot.data['username'];
  }
  toJson() {
    return {
      'username': this.staffname,
    };
  }
}
