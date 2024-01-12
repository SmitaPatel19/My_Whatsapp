import 'package:flutter/material.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Custom%20UI/LoginTextFormField.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';
import 'package:my_whatsapp/Model/colors.dart';
import 'package:my_whatsapp/Pages/VerifyPhoneNumberPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumbercontroller;

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'India');
    countryCodeController = TextEditingController(text: '91');
    phoneNumbercontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumbercontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text("Enter your phone number",style: TextStyle(
          color: context.theme.loginAppbarTextColor,
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
                PopupMenuItem(child: Text("Link as companion device")),
                PopupMenuItem(child: Text("Help")),
              ];
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'WhatsApp will need to verify your account. ',
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: "What's my number",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      )
                    ),
                  ],
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: LoginTextFormField(
              onTap: (){},
              controller: countryNameController,
              readOnly: true,
              suffixIcon: Icon(Icons.arrow_drop_down_outlined,color: Coloors.greenDark,),

            ),
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: LoginTextFormField(
                    onTap: (){},
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),

                const SizedBox(width: 10,),

                Expanded(
                  child: LoginTextFormField(
                    controller: phoneNumbercontroller,
                    hintText: "phone number",
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),

          Text("Carrier charges may apply",
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AgreeContinueButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => VerifyPhoneNumberPage()));
        },
        text: "Next",
        buttonWidth: 0, mright: 5,
      ),
    );
  }
}
