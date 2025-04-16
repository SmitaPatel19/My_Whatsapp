import 'package:flutter/material.dart';
import 'package:my_whatsapp/Extension/custom_theme_extension.dart';

showAlertDialog(
    {required BuildContext context, required String message, String? btnText}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message,
            style: TextStyle(
              color: context.theme.greyColor,
              fontSize: 15,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          actions: [
            TextButton(
              onPressed: () {
                return Navigator.of(context).pop();
              },
              child: Text(
                btnText ?? "OK",
                style: TextStyle(
                  color: context.theme.circleImageColor,
                ),
              ),
            ),
          ],
        );
      });
}
