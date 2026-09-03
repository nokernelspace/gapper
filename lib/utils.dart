import 'package:flutter/material.dart';

void showSnackBar(BuildContext ctx, String msg) {
  ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msg),
// action: SnackBarAction(
//     label: "Action",
//     onPressed: () {}
// ),
        behavior: .floating,
      )
  );
}