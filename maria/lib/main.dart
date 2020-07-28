import 'package:flutter/material.dart';
import 'package:maria/UI/MainScreen.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
