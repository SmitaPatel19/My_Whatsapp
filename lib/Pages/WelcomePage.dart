import 'package:flutter/material.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Custom%20UI/Language_Button_Ag.dart';
import 'package:my_whatsapp/Custom%20UI/Privacy_terms.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';
import 'package:my_whatsapp/Pages/LoginPage.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 115, left: 50, right: 50),
              child: Image.asset(
                'assets/circle.png',
                color: context.theme.circleImageColor,
              ),
            ),
          ),
          SizedBox(height: 53),
          Text(
            'Welcome to WhatsApp',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 17),
          PrivacyAndTerms(),
          SizedBox(height: 25),
          LanguageButton(),
          SizedBox(height: 125),
          AgreeContinueButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => LoginPage()));
            },
            text: 'Agree and continue',
            mright: 80,
          ),
        ],
      ),
    );
  }
}
