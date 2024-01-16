import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';

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
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          actions: [
            TextButton(
              onPressed: () {},
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
