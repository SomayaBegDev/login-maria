import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class AdminService extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
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
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "${service.name} new fee",
                                    labelStyle: TextStyle(color: appBarColor),
                                  ),
                                  onSaved: (val) {
                                    Provider.of<AdminProvider>(context,
                                            listen: false)
                                        .setFee(val);
                                  },
                                ),
                              ),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Provider.of<AdminProvider>(context, listen: false)
                                  .editService(service);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Edit Service",
                                style: TextStyle(color: appBarColor),
                              ),
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
