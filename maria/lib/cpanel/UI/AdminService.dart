import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/model/Service.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminService extends StatelessWidget {
  Service service;
  AdminService({this.service});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        Provider.of<AdminProvider>(context, listen: false)
            .deleteService(service.documentId);
      },
      child: Card(
        child: ListTile(
          title: Text(service.name),
          trailing: IconButton(
              icon: Icon(Icons.edit, color: appBarColor),
              onPressed: () {
                //Provider.of<AdminProvider>(context, listen: false).editService(service);
              }),
        ),
      ),
    );
  }
}
