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
          /*  trailing: IconButton(
            icon: Icon(Icons.edit, color: appBarColor),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: appBarColor,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Form(
                        key: formKey,
                        child: CupertinoActionSheet(
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: Card(
                                elevation: 0.0,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "This field is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: "${admin.adminname} new email",
                                    labelStyle: TextStyle(color: appBarColor),
                                  ),
                                  onChanged: (val) {
                                    adminProvider.setAdminEmail(val);
                                  },
                                ),
                              ),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              adminProvider.editAdmin(admin);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Edit Admin",
                                style: TextStyle(color: appBarColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),*/
        ),
      ),
    );
  }
}
