//UserCategory
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/cpanel/model/Service.dart';

class UserCategory {
  String documentId;
  String name;
  String imageUrl;
  // List<dynamic> services;

  UserCategory({this.documentId, this.name, this.imageUrl});
  UserCategory.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
    this.documentId = docSnapShot.documentID;
    // this.services = docSnapShot.data['services'];
    this.name = docSnapShot.data['name'];
    this.imageUrl = docSnapShot.data['imageUrl'];
  }

  toJson() {
    return {
      //'services': this.services,
      'name': this.name,
      'imageUrl': this.imageUrl
    };
  }
}
