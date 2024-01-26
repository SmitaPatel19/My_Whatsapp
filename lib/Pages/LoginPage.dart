import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Custom%20UI/LoginTextFormField.dart';
import 'package:my_whatsapp/Custom%20UI/ShowAlertDialog.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';
import 'package:my_whatsapp/Model/colors.dart';
import 'package:my_whatsapp/Pages/VerifyPhoneNumberPage.dart';
import 'package:my_whatsapp/auth/controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumbercontroller;

  sendCodeToPhone() {
    final phoneNumber = phoneNumbercontroller.text;
    final countryname = countryNameController.text;
    final countryCode = countryCodeController.text;


    if(phoneNumber.isEmpty){
      return showAlertDialog(
          context: context,
          message: "Please enter your phoneNumber number.");
    }
    if (phoneNumber.length < 10) {
      return showAlertDialog(
          context: context,
          message:
              "The number you entered is too short for the country: $countryname.\n\nInclude your area code if you haven't."
      );
    }
    else if (phoneNumber.length>10){
      return showAlertDialog(
          context: context,
          message: "The phoneNumber number you entered is too long: $countryname"
      );
    }

    // requesting verification
    ref.read(authControllerProvider).sendSmsCode(
        context: context,
        phoneNumber: "+$countryCode$phoneNumber"
    );
  }

  showCountryCodePicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: ['+91'],
        countryListTheme: CountryListThemeData(
          bottomSheetHeight: 600,
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: TextStyle(color: context.theme.greyColor),
          inputDecoration: InputDecoration(
            labelStyle: TextStyle(color: context.theme.greyColor),
            prefixIcon: const Icon(
              Icons.language,
              color: Coloors.greenDark,
            ),
            hintText: 'Search country code or name',
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            )),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: Coloors.greenDark,
            )),
          ),
        ),
        onSelect: (country) {
          countryNameController.text = country.name;
          countryCodeController.text = country.phoneCode;
        });
  }

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
            color: context.theme.loginAppbarTextColor,
          ),
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
            constraints: const BoxConstraints(minWidth: 40),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(child: Text("Link as companion device")),
                const PopupMenuItem(child: Text("Help")),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          )),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: LoginTextFormField(
                onTap: showCountryCodePicker,
                controller: countryNameController,
                readOnly: true,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Coloors.greenDark,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: LoginTextFormField(
                      onTap: showCountryCodePicker,
                      controller: countryCodeController,
                      prefixText: '+',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
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
            const SizedBox(
              height: 20,
            ),
            Text(
              "International carrier charges may apply",
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AgreeContinueButton(
        onPressed: sendCodeToPhone,
        text: "Next",
        buttonWidth: 0,
        mright: 5,
      ),
    );
  }
}
