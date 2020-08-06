import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminStaff extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  Staff staff;
  AdminStaff({this.staff});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        Provider.of<AdminProvider>(context, listen: false)
            .deleteStaff(staff.documentId);
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
                                    labelText: "${staff.staffname} new email",
                                    labelStyle: TextStyle(color: appBarColor),
                                  ),
                                  onChanged: (val) {
                                    Provider.of<AdminProvider>(context,
                                            listen: false)
                                        .setStaffEmail(val);
                                  },
                                ),
                              ),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Provider.of<AdminProvider>(context, listen: false)
                                  .editStaff(staff);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Edit Staff",
                                style: TextStyle(color: appBarColor),
                              ),
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
