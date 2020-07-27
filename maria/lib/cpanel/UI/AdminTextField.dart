import 'package:flutter/material.dart';
import 'package:maria/cpanel/UI/ShowStaff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminTextField extends StatelessWidget {
  Icon icon;
  String label;
  textFieldType type;
  AdminTextField({this.label, this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);

    return TextField(
      onChanged: (value) {
        if (type == textFieldType.staffname) {
          adminProvider.setStaffName(value);
        } else if (type == textFieldType.email) {
          adminProvider.setStaffEmail(value);
        } else if (type == textFieldType.password) {
          adminProvider.setStaffPassword(value);
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: this.label, icon: this.icon),
    );
  }
}
