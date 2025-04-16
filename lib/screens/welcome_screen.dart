import 'package:flutter/material.dart';
import 'package:my_whatsapp/widgets/custom_elevated_button.dart';
import 'package:my_whatsapp/widgets/language_button_ag.dart';
import 'package:my_whatsapp/widgets/privacy_and_terms.dart';
import 'package:my_whatsapp/Extension/custom_theme_extension.dart';
import 'package:my_whatsapp/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomElevatedButton(
                        onPressed: () {
                          navigateToLoginPage(context);
                        },
                        text: 'Agree and continue',
                        mright: 80,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
