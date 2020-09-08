import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String documentId;
  String name;
  double fee;
  String imageUrl;

  Service({this.documentId, this.name, this.fee, this.imageUrl});
  Service.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.name = docSnapShot.data['name'];
    this.fee = docSnapShot.data['fee'];
    this.imageUrl = docSnapShot.data['imageUrl'];
  }
  toJson() {
    return {
      'name': this.name,
      'fee': this.fee,
      'imageUrl': this.imageUrl,
    };
  }
}
