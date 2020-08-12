import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/cpanel/UI/ControlPanel.dart';
import 'package:maria/cpanel/model/Admin.dart';
import 'package:maria/cpanel/model/Staff.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/model/User.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'Registration.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String uName;
  String upass;

  bool isUser(String un, String pass, List<User> allUser) {
    bool isUser = false;
    for (int i = 0; i < allUser.length; i++) {
      if (allUser[i].username == un && allUser[i].password == pass) {
        isUser = true;
        break;
      }
    }
    return isUser;
  }

  bool isAdmin(String un, String pass, List<Admin> allAdmin) {
    bool isAdmin = false;
    for (int i = 0; i < allAdmin.length; i++) {
      if (allAdmin[i].adminname == un && allAdmin[i].password == pass) {
        isAdmin = true;
        break;
      }
    }
    return isAdmin;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProv = Provider.of<UserProvider>(context, listen: false);
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    userProv.getAllUser();
    adminProvider.getAllAdmin();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer2<AdminProvider, UserProvider>(
          builder: (context, adminPro, userPro, child) {
        List<Admin> allAdmin = adminPro.allAdmin;
        List<User> allUsers = userPro.allUsers;
        return Form(
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
                  onChanged: (val) {
                    this.uName = val;
                  },
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
                  onChanged: (val) {
                    this.upass = val;
                  },
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
                    Navigator.of(context).pop(Locale);
                    bool isAUser = isUser(this.uName, this.upass, allUsers);
                    bool isaAdmin = isAdmin(this.uName, this.upass, allAdmin);
                    if (isAUser) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserMainScreen(),
                      ));
                    } else if (isaAdmin) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ControlPanel(),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    }
                  },
                  color: Color(0xffff6ea1),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15, color: Color(0xffff6ea1)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Registration()));
                    },
                    child: Text(
                      "Join us ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffff6ea1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              /* RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Services(),
                ));*/
              },
              color: Colors.red,
              child: Text(
                "Login with Gmail",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )*/
            ]),
          ),
        );
      }),
    );
  }
}

class MyShowDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnackBar(
        content: Text("Invalied"),
        duration: Duration(seconds: 5),
      ),
    );
  }
}

/*Form(
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
                onChanged: (val) {
                  this.uName = val;
                },
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
                onChanged: (val) {
                  this.upass = val;
                },
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Services(),
                  ));
                },
                color: Color(0xffff6ea1),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 15, color: Color(0xffff6ea1)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registration()));
                  },
                  child: Text(
                    "Join us ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffff6ea1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            /* RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Services(),
                ));*/
              },
              color: Colors.red,
              child: Text(
                "Login with Gmail",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )*/
          ]),
        ),
      ),*/
