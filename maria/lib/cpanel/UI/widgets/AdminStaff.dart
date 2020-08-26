import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/UI/ShowStaff.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminStaff extends StatelessWidget {
  Staff staff;
  AdminStaff({this.staff});

  String newEmail = "";
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        adminProvider.deleteStaff(staff.documentId);
      },
      child: Card(
        child: ListTile(
          title: Text(staff.staffname),
          subtitle: Text(staff.email),
          trailing: IconButton(
            icon: Icon(Icons.edit, color: appBarColor),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: appBarColor,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        child: CupertinoActionSheet(
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: Card(
                                elevation: 0.0,
                                child: TextField(
                                  onChanged: (val) {
                                    staff.email = val;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "${staff.staffname} New Email",
                                  ),
                                ),
                              ),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              adminProvider.editStaff(staff, staff.documentId);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (_) => Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "The staff's email has been updated correctly!",
                                              style: showDiaStyle,
                                            ),
                                            FlatButton(
                                              child: Text('Got it'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ShowStaff()));
                                              },
                                            ),
                                          ],
                                        ),
                                      ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Edit Staff"),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
