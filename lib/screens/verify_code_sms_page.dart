import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_whatsapp/Extension/custom_theme_extension.dart';
import 'package:my_whatsapp/Model/colors.dart';
import 'package:my_whatsapp/auth/controller/auth_controller.dart';

class VerifyCodeSMSPage extends ConsumerWidget {
  const VerifyCodeSMSPage({super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(
      BuildContext context,
      WidgetRef ref,
      String smsCode,
      ){
    ref.read(authControllerProvider).verifySmsCode(
      context: context,
      smsCodeId: smsCodeId,
      smsCode: smsCode,
      mounted: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text("Verifying your number",style: TextStyle(
          color: context.theme.authAppbarTextColor,
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
                          text: "You've tried to register",
                        ),
                        TextSpan(
                          text: "$phoneNumber",
                          style: TextStyle(
                            color: context.theme.blackwhiteColor,
                          ),
                        ),

                        const TextSpan(
                            text: " recently. Wait before requesting an SMS or a call with your code. "
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

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: TextFormField(
                onTap: (){

                },
                onChanged: (value) {
                  if(value.length==6){
                    return verifySmsCode(context, ref, value);
                  }
                },
                autofocus: true,
                cursorColor: Coloors.greenDark,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: '_ _ _  _ _ _',
                  hintStyle: TextStyle(color: context.theme.greyColor),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Coloors.greenDark,width: 2,),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Coloors.greenDark,width: 2,),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Text("Enter 6-digit code",style: TextStyle(
              color: context.theme.greyColor,
            ),),

            const SizedBox(height: 20,),

            Text("Didn't receive code?",style: TextStyle(
              color: context.theme.authAppbarTextColor,
            ),),

            Text("You may request a new code in 1.00",style: TextStyle(
              color: context.theme.greyColor,
            ),),
          ],
        ),
      ),
    );
  }
}