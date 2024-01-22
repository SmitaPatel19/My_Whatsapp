import 'package:flutter/material.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Custom%20UI/Language_Button_Ag.dart';
import 'package:my_whatsapp/Custom%20UI/Privacy_terms.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';
import 'package:my_whatsapp/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context){
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 115, left: 50, right: 50),
            child: Image.asset(
              'assets/circle.png',
              color: context.theme.circleImageColor,
            ),
          ),
          const SizedBox(height: 53),
          const Text(
            'Welcome to WhatsApp',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 17),
          const PrivacyAndTerms(),
          const SizedBox(height: 25),
          const LanguageButton(),
          const SizedBox(height: 125),
          AgreeContinueButton(
            onPressed: () {
              navigateToLoginPage(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (builder) => LoginPage()));
            },
            text: 'Agree and continue',
            mright: 80,
          ),
        ],
      ),
    );
  }
}
