import 'package:flutter/material.dart';

SnackBar mySnackBar({context, error, Widget}) {
  return SnackBar(
    content: Text(error),
    action: SnackBarAction(
      label: "Got it",
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Widget));
      },
    ),
  );
}
