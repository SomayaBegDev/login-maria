import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String documentId;
  String name;
  double fee;
  Service({
    this.documentId,
    this.name,
    this.fee,
  });
  Service.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    this.name = docSnapShot.data['name'];
    this.fee = docSnapShot.data['fee'];
  }
  toJson() {
    return {
      'name': this.name,
      'fee': this.fee,
    };
  }
}
