import 'package:flutter/cupertino.dart';
import 'package:my_whatsapp/Extension/custom_theme_extension.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Read our ',
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: context.theme.blueColor,
                      )),
                  const TextSpan(text: ' Tap "Agree and continue" to accept the '),
                  TextSpan(
                      text: 'Terms of Services.',
                      style: TextStyle(
                        color: context.theme.blueColor,
                      )),
                ])),
      ],
    ));
  }
}
