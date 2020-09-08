import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/UI/ControlPanel.dart';
import 'package:maria/cpanel/UI/ShowCategories.dart';
import 'package:maria/cpanel/model/Category.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

import '../ShowServices.dart';

class AdminCategory extends StatelessWidget {
  Category category;

  AdminCategory({this.category});

  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        adminProvider.deleteCategory(category.documentId);
      },
      child: Card(
        child: ListTile(
          title: Text(category.name),
          subtitle: Text("Services count :"),
          trailing: IconButton(
            icon: Icon(
              Icons.dashboard,
              color: appBarColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ShowServices(category)));
            },
          ),
        ),
      ),
    );
  }
}
