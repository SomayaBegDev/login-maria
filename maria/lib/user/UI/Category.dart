import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/user/UI/Services.dart';
import 'package:maria/user/model/UserCategory.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  int selIndex = 0;
  String uName;
  Category(this.uName);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.getAllCategories();
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        List<UserCategory> allCategories = value.allCategories;
        if (allCategories.isEmpty) {
          return Center(
            child: Text('No Services Available'),
          );
        } else {
          return GridView.builder(
            itemCount: allCategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  // padding: EdgeInsets.all(3),
                  //margin: EdgeInsets.all(5),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: CachedNetworkImage(
                          // cacheManager: Ca,
                          imageUrl: allCategories[index].imageUrl,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Text(
                        allCategories[index].name,
                        style: TextStyle(
                            color: const Color(0xffff6ea1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                onTap: () {
                  selIndex = index;
                  userProvider.setCategory(allCategories[selIndex].name);
                  userProvider.setUserName(this.uName);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Services(this.uName, allCategories[selIndex])));
                },
              );
            },
          );
        }
      },
    );
  }
}
