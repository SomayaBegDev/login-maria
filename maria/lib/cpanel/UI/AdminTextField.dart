import 'package:flutter/material.dart';
import 'package:maria/cpanel/UI/Process.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminTextField extends StatelessWidget {
  String label;
  textFieldType type;
  AdminTextField({this.label, this.type});

  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);

    return TextField(
      onChanged: (value) {
        if (type == textFieldType.name) {
          adminProvider.setServiceName(value);
        } else if (type == textFieldType.fee) {
          adminProvider.setFee(value);
        } else if (type == textFieldType.staffname) {
          adminProvider.setStaffName(value);
        } else if (type == textFieldType.email) {
          adminProvider.setStaffEmail(value);
        } else if (type == textFieldType.password) {
          adminProvider.setStaffPassword(value);
        }
      },
      keyboardType:
          type == textFieldType.fee ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: this.label,
      ),
    );
  }
}
