import 'package:flutter/material.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';
import 'package:my_whatsapp/Model/colors.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Profile info",style: TextStyle(
          color: context.theme.loginAppbarTextColor,
          fontSize: 18,),
        ),

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
        child: Column(
          children: [
            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Please provide your name and an optional profile photo",style: TextStyle(
                color: context.theme.greyColor,
              ),textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20,),

            CircleAvatar(
              radius: 52,
              backgroundColor: context.theme.photoIconBgColor,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3.0,right: 3),
                child: Icon(Icons.add_a_photo_rounded,
                  size: 48,
                  color: context.theme.photoIconColor,),
              ),
            ),

            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Coloors.greenDark,
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Type your name here',
                        hintStyle: TextStyle(
                          color: context.theme.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.greenDark,width: 2),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 5,),

                  Icon(Icons.emoji_emotions_rounded,
                    color: context.theme.photoIconColor,),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AgreeContinueButton(
          onPressed: (){},
          text: 'Next',
          buttonWidth: 90,
          mright: 3,
      ),
    );
  }
}
