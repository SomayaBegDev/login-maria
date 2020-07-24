import 'package:flutter/material.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

import '../../Constant/Images/ImagesAndConst.dart';
import 'AdminTextField.dart';

enum textFieldType { name, fee }

class Process extends StatelessWidget {
  int stOrSer;
  int adOrRem;
  Process(stOrSer, this.adOrRem);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    if (stOrSer == 0) {
      if (adOrRem == 0) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffff6ea1),
            title: Text(
              'Add Staff',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Center(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xffff6ea1),
                      ),
                      labelText: 'Username *',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xffff6ea1),
                      ),
                      labelText: 'Password *',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xffff6ea1),
                      ),
                      labelText: 'Re-write password *',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xffff6ea1),
                      ),
                      labelText: 'Email address *',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(minWidth: 200),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      adminProvider.addNewService();
                    },
                    color: Color(0xffff6ea1),
                    child: Text(
                      "Add Staff",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffff6ea1),
            title: Text(
              'Remove Staff',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Staff ID *',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 200),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Services(),
                        ));*/
                      },
                      color: Color(0xffff6ea1),
                      child: Text(
                        "Remove Staff",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      if (adOrRem == 0) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffff6ea1),
            title: Text(
              'Add Service',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            child: Center(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: AdminTextField(
                      label: "Service Name *",
                      type: textFieldType.name,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: AdminTextField(
                      label: "Fee *",
                      type: textFieldType.fee,
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
                      adminProvider.addNewService();
                    },
                    color: Color(0xffff6ea1),
                    child: Text(
                      "Add Service",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffff6ea1),
            title: Text(
              'Remove Service',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Service ID *',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 200),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Services(),
                        ));*/
                      },
                      color: Color(0xffff6ea1),
                      child: Text(
                        "Remove Service",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
  }
}
