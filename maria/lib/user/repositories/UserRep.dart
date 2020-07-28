import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/Constant/MySnackBar.dart';
import 'package:maria/user/model/User.dart';
import 'UserFB.dart';

class UserRep {
  UserRep._();
  static UserRep userRep = UserRep._();
  //User section
  Future<List<User>> getAllUse() async {
    try {
      List<DocumentSnapshot> documents = await UserFB.userFB.getAllUsers();

      List<User> users =
      documents.map((e) => User.fromDocumetSnapshot(e)).toList();

      return users;
    } catch (error) {
      mySnackBar(error: error);
    }
  }
}

