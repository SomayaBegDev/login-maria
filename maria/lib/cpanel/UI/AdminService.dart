import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminService extends StatelessWidget {
  double newFee = 0;
  GlobalKey<FormState> formKey = GlobalKey();
  Service service;

  AdminService({this.service});

  editService(BuildContext context, String fee) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        Provider.of<AdminProvider>(context, listen: false).setFee(fee);
        Navigator.pop(context);
      } catch (error) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(error.toString()),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Got it"),
                  )
                ],
              );
            });
      }
    }
  }

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
          subtitle: Text("Fee : ${service.fee}"),
          trailing: IconButton(
            icon: Icon(
              Icons.edit,
              color: appBarColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: appBarColor,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Form(
                        key: formKey,
                        child: CupertinoActionSheet(
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: Card(
                                elevation: 0.0,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "This field is required";
                                    } else {
                                      newFee = double.parse(val);
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "${service.name} New Fee",
                                  ),
                                  onSaved: (val) {
                                    //code to add
                                    Provider.of<AdminProvider>(context,
                                            listen: false)
                                        .setFee("${newFee}");
                                  },
                                ),
                              ),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              editService(context, "${newFee}");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Edit service"),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
