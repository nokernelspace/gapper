import 'package:flutter/material.dart';

Future<void> showCancelableMessageBox(
  BuildContext ctx,
  String title,
  String message,
  {void Function()? onConfirm,
  void Function()? onCancel}
) {
  return showDialog<void>(
    context: ctx,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(child: const Text("Cancel"), onPressed: () {
            Navigator.of(ctx).pop();
          }),
          TextButton(child: const Text("Ok"), onPressed: (){
            if (onConfirm != null) {
              onConfirm();
              Navigator.of(ctx).pop();
            }
          }),
        ],
      );
    },
  );
}

Future<void> showConfirmMessageBox(
  BuildContext ctx,
  String title,
  String message,
  void Function()? onPressed,
) {
  return showDialog<void>(
    context: ctx,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(child: const Text("Ok"), onPressed: (){
            if (onPressed != null) {
              onPressed();
              Navigator.of(ctx).pop();
            }
          }),
        ],
      );
    },
  );
}

Future<void> showEditDialogBox(
  BuildContext ctx,
  String title,
  TextEditingController controller,
  void Function()? onConfirm,
) {
  return showDialog<void>(
    context: ctx,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: TextField(maxLines: 1, controller: controller),

        ///NOTE :very interesting dart type specification
        actions: <Widget>[
          TextButton(child: const Text("Cancel"), onPressed: () {
            Navigator.of(ctx).pop();
          }),
          TextButton(child: const Text("Ok"), onPressed: (){
            if (onConfirm != null) {
              onConfirm();
              Navigator.of(ctx).pop();
            }
          }),
        ],
      );
    },
  );
}
