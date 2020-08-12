import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/UI/AdminAd.dart';
import 'package:maria/cpanel/UI/AdminStaff.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/cpanel/UI/AdminTextField.dart';
import 'package:provider/provider.dart';

class ShowAdmins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text('Admin Control Panel'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'New Admin',
              ),
              Tab(
                text: 'All Admin',
              )
            ]),
          ),
          body: TabBarView(children: [AddNewAdmin(), AllAdmin()]),
        ));
  }
}

class AddNewAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextField(
                onChanged: (value) {
                  adminProvider.setAdminName(value);
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Admin Name *",
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextField(
                onChanged: (value) {
                  adminProvider.setAdminEmail(value);
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email Address *",
                ),
              )),
          SizedBox(
            height: 10,
          ),
          /*Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: AdminTextField(
                      label: "Re-write password *",
                      type: textFieldType.password2,
                    )),
                SizedBox(
                  height: 10,
                ),*/
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextField(
                onChanged: (value) {
                  adminProvider.setAdminPassword(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Password *",
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 200),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                adminProvider.addNewAdmin();
              },
              color: Color(0xffff6ea1),
              child: Text(
                "Add Admin",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class AllAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    adminProvider.getAllAdmin();
    // TODO: implement build
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        List<Admin> allAdmin = value.allAdmin;
        if (allAdmin.isEmpty) {
          return Center(
            child: Text('No Admin Found'),
          );
        } else {
          return ListView.builder(
            itemCount: allAdmin.length,
            itemBuilder: (context, index) {
              return AdminAd(
                admin: allAdmin[index],
              );
            },
          );
        }
      },
    );
  }
}
