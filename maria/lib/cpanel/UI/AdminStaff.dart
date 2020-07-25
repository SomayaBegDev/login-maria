import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/model/Staff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminStaff extends StatelessWidget {
  Staff staff;
  AdminStaff({this.staff});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        Provider.of<AdminProvider>(context, listen: false)
            .deleteService(staff.documentId);
      },
      child: Card(
        child: ListTile(
          title: Text(staff.staffname),
          trailing: IconButton(
              icon: Icon(Icons.edit, color: appBarColor),
              onPressed: () {
                Provider.of<AdminProvider>(context, listen: false)
                    .editStaff(staff);
              }),
        ),
      ),
    );
  }
}
