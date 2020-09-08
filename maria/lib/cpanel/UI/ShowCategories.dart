import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/UI/widgets/AdminCategory.dart';
import 'package:maria/cpanel/model/Category.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/cpanel/UI/widgets/AdminService.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class ShowCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text('Category Control Panel'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'New Category',
              ),
              Tab(
                text: 'All Categories',
              )
            ]),
          ),
          body: TabBarView(children: [AddNewCategory(), AllCategories()]),
        ));
  }
}

class AddNewCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(
          height: screenSize.height / 70,
        ),
        GestureDetector(
          onTap: () async {
            PickedFile imageFile = await ImagePicker().getImage(
                source: ImageSource.gallery, maxWidth: 250, maxHeight: 250);
            File file = File(imageFile.path);
            Provider.of<AdminProvider>(context, listen: false)
                .uploadCategoryImage(file);
          },
          child: Consumer<AdminProvider>(
            builder: (context, value, child) {
              String imageUrl = value.categoryImageUrl;
              if (imageUrl == null) {
                return Container(
                  height: screenSize.height / 3,
                  width: screenSize.width / 2,
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                      "Upload image",
                      style: TextStyle(color: appBarColor),
                    ),
                  ),
                );
              } else {
                return CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: screenSize.height / 3,
                  width: screenSize.width / 2,
                );
              }
            },
          ),
        ),
        SizedBox(
          height: screenSize.height / 90,
        ),
        TextField(
          onChanged: (value) {
            adminProvider.setCategoryName(value);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Category Name *",
          ),
        ),
        SizedBox(
          height: screenSize.height / 90,
        ),
        Container(
          //constraints: BoxConstraints(minWidth: 200),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              adminProvider.addNewCategory();
              showModalBottomSheet(
                context: context,
                builder: (_) => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "The category has been correctly added",
                        style: showDiaStyle,
                      ),
                      FlatButton(
                        child: Text('Got it'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ShowCategories()));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            color: Color(0xffff6ea1),
            child: Text(
              "Add Category",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ]),
    );
  }
}

class AllCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);

    adminProvider.getAllCategories();

    // TODO: implement build
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        List<Category> allCategories = value.allCategories;
        if (allCategories.isEmpty) {
          return Center(
            child: Text('No Categories Found'),
          );
        } else {
          return ListView.builder(
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              return AdminCategory(
                category: allCategories[index],
              );
            },
          );
        }
      },
    );
  }
}
