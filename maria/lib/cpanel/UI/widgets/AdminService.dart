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

class AdminService extends StatelessWidget {
  Service service;
  Category category;

  AdminService({this.service, this.category});

  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        adminProvider.deleteService(service.documentId, category);
      },
      child: Card(
        child: ListTile(
          title: Text(service.name),
          subtitle: Text("Fee : ${service.fee}"),
          trailing: IconButton(
            icon: Icon(
              Icons.edit,
              color: appBarColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (val) {
                            service.fee = double.parse(val);
                          },
                          decoration: InputDecoration(
                            labelText: "${service.name} New Fee",
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              adminProvider.editService(
                                  service, service.documentId, category);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (_) => Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "The service has been updated correctly!",
                                              style: showDiaStyle,
                                            ),
                                            FlatButton(
                                              child: Text('Got it'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ShowServices(this
                                                                    .category)));
                                              },
                                            ),
                                          ],
                                        ),
                                      ));
                            },
                            color: Color(0xffff6ea1),
                            child: Text(
                              "Edit Service",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
/*  adminProvider.editService(
                                  service, service.documentId);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (_) => Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "The service has been updated correctly!",
                                              style: showDiaStyle,
                                            ),
                                            FlatButton(
                                              child: Text('Got it'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ShowServices()));
                                              },
                                            ),
                                          ],
                                        ),
                                      ));
*/
