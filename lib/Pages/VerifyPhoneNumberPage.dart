import 'package:flutter/material.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Custom%20UI/Language_Button_Ag.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';

class VerifyPhoneNumberPage extends StatelessWidget {
  const VerifyPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text("Verify phone number",style: TextStyle(
          color: context.theme.loginAppbarTextColor,
          fontSize: 18
        ),),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value){

            },
            splashRadius: 22,
            iconSize: 22,
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.more_vert,
              color: context.theme.greyColor,
            ),
            constraints: BoxConstraints(minWidth: 40),
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text("Help")),
              ];
            },
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.only(left: 50,right: 50),
        child: Column(
          children: [

            SizedBox(height: 15,),

            Center(
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.tealAccent.shade100,
                child: Icon(Icons.phone_missed_rounded,color: Colors.teal,size: 30,),
              ),
            ),

            SizedBox(height: 25,),

            Expanded(

                child: Text("To automatically verify with a missed call to your phone:",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,)
            ),


            Row(
              children: [
                Icon(Icons.call,color: context.theme.greyColor,),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: RichText(text: TextSpan(
                          text: "Allow WhatsApp to manage this call",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,

                          ),
                        )),
                      ),

                      Text("so we can call your phone number and end the call automatically.",
                        style: TextStyle(
                        color: context.theme.greyColor,
                        fontSize: 12,
                      ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 22,),

            Row(
              children: [
                Icon(Icons.wifi_calling_3_rounded,color: context.theme.greyColor,),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(right: 48),
                        child: RichText(text: TextSpan(
                          text: 'Allow WhatsApp to a one-time',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                      ),


                      RichText(text: TextSpan(
                        text: 'check ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),

                        children: [
                          TextSpan(
                            text: 'and access your call log so we can confirm that you received the call.',
                            style: TextStyle(
                              color: context.theme.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ]
                      )),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

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
                    ]
                  ),
                  ),
                ],
              ),
            ),

            AgreeContinueButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => ));
              },
              text: 'Continue',
              buttonWidth: 90, mright: 77,
            ),

            SizedBox(height: 10,),
            
            AgreeContinueButton(
              onPressed: () {
                showBottomSheet(context: context, builder: (BuildContext context){
                  return Container(
                    height: 200,
                  );
                });
                 //Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageButton()));
                },
              text: 'Verify another way',
              buttonWidth: 90,
              mright: 46,

            ),

            SizedBox(height: 170,)
          ],
        ),
      ),
    );
  }
}
