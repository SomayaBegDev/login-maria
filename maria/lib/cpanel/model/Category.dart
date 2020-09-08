import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/cpanel/model/Service.dart';

class Category {
  String documentId;
  String name;
  String imageUrl;
  // List<dynamic> services;

  Category({this.documentId, this.name, this.imageUrl});
  Category.fromDocumetSnapshot(DocumentSnapshot docSnapShot) {
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
