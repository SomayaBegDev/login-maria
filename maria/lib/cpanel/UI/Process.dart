/*import 'package:flutter/material.dart';
import 'package:maria/cpanel/UI/AdminService.dart';
import 'package:maria/cpanel/UI/AdminStaff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:provider/provider.dart';

import '../../Constant/Images/ImagesAndConst.dart';
import 'AdminTextField.dart';

//enum textFieldType { name, fee, staffname, email, password }
/*icon: Icon(
                        Icons.person,
                        color: Color(0xffff6ea1),
                      ),*/

/* icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xffff6ea1),
                      ),*/

/* icon: Icon(
                        Icons.email,
                        color: Color(0xffff6ea1),
                      ),*/

class Process extends StatelessWidget {
  int stOrSer;
  int adOrRem;
  Process(this.stOrSer, this.adOrRem);
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
          body:
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
          body: Consumer<AdminProvider>(
            builder: (context, value, child) {
              List<Staff> allStaff = value.allStaff;
              if (allStaff.isEmpty) {
                return Center(
                  child: Text('No Staff Found'),
                );
              } else {
                return ListView.builder(
                  itemCount: allStaff.length,
                  itemBuilder: (context, index) {
                    return AdminStaff(
                      staff: allStaff[index],
                    );
                  },
                );
              }
            },
            //child: Container(),
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
                      //type: textFieldType.name,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: AdminTextField(
                      label: "Fee *",
                      //type: textFieldType.fee,
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
          body: Consumer<AdminProvider>(
            builder: (context, value, child) {
              List<Service> allServices = value.allServices;
              if (allServices.isEmpty) {
                return Center(
                  child: Text('No Services Found'),
                );
              } else {
                return ListView.builder(
                  itemCount: allServices.length,
                  itemBuilder: (context, index) {
                    return AdminService(
                      service: allServices[index],
                    );
                  },
                );
              }
            },
            //child: Container(),
          ),
        );
      }
    }
  }
}
*/
