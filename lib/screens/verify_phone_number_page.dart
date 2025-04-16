import 'package:flutter/material.dart';
import 'package:my_whatsapp/Extension/custom_theme_extension.dart';
import 'package:my_whatsapp/widgets/custom_elevated_button.dart';
import '../widgets/custom_icon_button.dart';
import 'verify_code_sms_page.dart';

class VerifyPhoneNumberPage extends StatelessWidget {
  const VerifyPhoneNumberPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Verify phone number",
          style:
              TextStyle(color: context.theme.authAppbarTextColor, fontSize: 18),
        ),
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
            constraints: const BoxConstraints(minWidth: 200, maxHeight: 55),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(child: Text("Help")),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          height: MediaQuery.of(context).size.height - 255,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.tealAccent.shade100,
                  child: const Icon(
                    Icons.phone_missed_rounded,
                    color: Colors.teal,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Expanded(
                  child: Text(
                "To automatically verify with a missed call to your phone:",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: context.theme.greyColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        RichText(
                            text: TextSpan(
                          text: "Allow WhatsApp to manage this call",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: context.theme.blackwhiteColor,
                          ),
                        )),
                        Text(
                          "so we can call your phone number and end the call automatically.",
                          style: TextStyle(
                            color: context.theme.greyColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Icon(
                    Icons.wifi_calling_3_rounded,
                    color: context.theme.greyColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: RichText(
                              text: TextSpan(
                            text: 'Allow WhatsApp to do a one-time',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: context.theme.blackwhiteColor,
                            ),
                          )),
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'check ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: context.theme.blackwhiteColor,
                                ),
                                children: [
                              TextSpan(
                                text:
                                    'and access your call log so we can confirm that you received the call.',
                                style: TextStyle(
                                  color: context.theme.greyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ])),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Learn more about how you can manage your",
                          style: TextStyle(
                            color: context.theme.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: ' phone verification permissions.',
                              style: TextStyle(
                                color: context.theme.blueColor,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => VerifyCodeSMSPage(
                                smsCodeId: smsCodeId,
                                phoneNumber: phoneNumber,
                              )));
                },
                text: 'Continue',
                mright: 77,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomIconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: Icons.close,
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                  'Verify your phone number another way',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "You can receive your verification code by text message (SMS) or phone call.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: context.theme.greyColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomElevatedButton(
                                  onPressed: () {},
                                  text: "Send SMS",
                                  mright: 88),
                              SizedBox(
                                height: 10,
                              ),
                              CustomElevatedButton(
                                  onPressed: () {},
                                  text: "Call me",
                                  mright: 95),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        );
                      });
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageButton()));
                },
                text: 'Verify another way',
                mright: 46,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
