//UserService
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  String documentId;
  String name;
  double fee;
  String imageURL;
  UserService({this.name, this.fee});
  UserService.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.name = docSnapShot.data['name'];
    this.fee = docSnapShot.data['fee'];
    this.imageURL = docSnapShot.data['imageUrl'];
  }
  toJson() {
    return {'name': this.name, 'fee': this.fee, 'imageUrl': this.imageURL};
  }
}
