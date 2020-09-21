import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminAd extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  Admin admin;
  AdminAd({this.admin});
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        adminProvider.deleteAdmin(admin.documentId);
      },
      child: Card(
        child: ListTile(
          title: Text(admin.adminname),
          subtitle: Text(admin.email),
        ),
      ),
    );
  }
}
