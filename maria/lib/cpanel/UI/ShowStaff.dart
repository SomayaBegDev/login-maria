import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/UI/widgets/AdminStaff.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/cpanel/UI/widgets/AdminTextField.dart';
import 'package:provider/provider.dart';

class ShowStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text('Staff Control Panel'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'New Staff',
              ),
              Tab(
                text: 'All Staff',
              )
            ]),
          ),
          body: TabBarView(children: [AddNewStaff(), AllStaff()]),
        ));
  }
}

enum textFieldType { staffname, email, password }

class AddNewStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(
          height: screenSize.height / 90,
        ),
        Container(
            //constraints: BoxConstraints(maxWidth: 400),
            child: AdminTextField(
          label: "Username *",
          type: textFieldType.staffname,
          icon: Icon(
            Icons.person,
            color: appBarColor,
          ),
        )),
        SizedBox(
          height: screenSize.height / 90,
        ),
        Container(
            //constraints: BoxConstraints(maxWidth: 400),
            child: AdminTextField(
          label: "Email address *",
          type: textFieldType.email,
          icon: Icon(
            Icons.email,
            color: appBarColor,
          ),
        )),
        SizedBox(
          height: screenSize.height / 90,
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
            //constraints: BoxConstraints(maxWidth: 400),
            child: AdminTextField(
          label: "Password *",
          type: textFieldType.password,
          icon: Icon(
            Icons.vpn_key,
            color: appBarColor,
          ),
        )),
        SizedBox(
          height: screenSize.height / 90,
        ),
        Container(
          constraints: BoxConstraints(minWidth: 200),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              adminProvider.addNewStaff();
              showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "The staf has been correctly added",
                              style: showDiaStyle,
                            ),
                            FlatButton(
                              child: Text('Got it'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ShowStaff()));
                              },
                            ),
                          ],
                        ),
                      ));
            },
            color: Color(0xffff6ea1),
            child: Text(
              "Add Staff",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ]),
    );
  }
}

class AllStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).getAllStaff();
    // TODO: implement build
    return Consumer<AdminProvider>(
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
    );
  }
}
