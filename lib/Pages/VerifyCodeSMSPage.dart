import 'package:flutter/material.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';

class VerifyCodeSMSPage extends StatefulWidget {
  const VerifyCodeSMSPage({super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  final String verificationId;
  final String phoneNumber;


  @override
  State<VerifyCodeSMSPage> createState() => _VerifyCodeSMSPageState();
}

class _VerifyCodeSMSPageState extends State<VerifyCodeSMSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text("Verifying your number",style: TextStyle(
          color: context.theme.loginAppbarTextColor,
          fontSize: 18,
        ),),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            splashRadius: 22,
            iconSize: 22,
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.more_vert,
              color: context.theme.greyColor,
            ),
            constraints: const BoxConstraints(minWidth: 40),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(child: Text("Help")),
              ];
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    const TextSpan(
                      text: "You've tried to register ",
                    ),
                    TextSpan(
                      text: "+91 1234567890",
                      style: TextStyle(
                        color: context.theme.blackwhiteColor,
                      ),
                    ),

                    const TextSpan(
                      text: "recently. Wait before requesting an SMS or a call with your code. "
                    ),

                    TextSpan(
                      text: "Wrong number?",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      ),
                    ),
                  ]
                )),
              ),

              const SizedBox(height: 20,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

              ),
          ],
        ),
      ),
    );
  }
}
