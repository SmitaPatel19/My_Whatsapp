import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_whatsapp/Custom%20UI/Agree_ContinueButton.dart';
import 'package:my_whatsapp/Custom%20UI/CustomIconButton.dart';
import 'package:my_whatsapp/Custom%20UI/Short_HBar.dart';
import 'package:my_whatsapp/Custom%20UI/ShowAlertDialog.dart';
import 'package:my_whatsapp/Extension/customThemeExtension.dart';
import 'package:my_whatsapp/Model/colors.dart';
import 'package:my_whatsapp/Pages/ImagePickerPage.dart';
import 'package:my_whatsapp/auth/controller/auth_controller.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {

  File? imageCamera;
  Uint8List? imageGallery;
  late TextEditingController usernameController;

  saveUserDataToFirebase()async{
    String username =usernameController.text;

    if(username.isEmpty){
      return showAlertDialog(
          context: context,
          message: 'Please provide a username.'
      );
    }
    else if(username.length<3 || username.length>20){
      return showAlertDialog(
          context: context,
          message: 'A username length should be between 3-20'
      );
    }
    ref.read(authControllerProvider).saveUserInfoFirstore(
        username: username,
        profileImage: imageCamera ?? imageGallery ?? "",
        context: context,
        mounted: mounted,

    );
  }

  imagePickerTypeBottomSheet(){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ShortHBar(),

              Row(
                children: [
                  const SizedBox(width: 20,),

                  const Text("Profile Photo",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                  ),

                  const Spacer(),

                  CustomIconButton(
                      onTap: ()=> Navigator.pop(context),
                      icon: Icons.close
                  ),

                  const SizedBox(width: 15,),
                ],
              ),

              Divider(color: context.theme.greyColor!.withOpacity(0.3),),

              const SizedBox(height: 5,),

              Row(
                children: [
                  const SizedBox(width: 20,),

                  imagePickerIcon(
                      onTap: pickImageFromCamera,
                      icon: Icons.camera_alt_rounded,
                      text: "Camera"
                  ),

                  const SizedBox(width: 15,),

                  imagePickerIcon(
                      onTap: () async{
                        Navigator.pop(context);
                        final image = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context)=> const ImagePickerPage()
                            )
                        );
                        if(image == null) return;
                        setState(() {
                          imageGallery = image;
                          imageCamera = null;
                        });
                      },
                      icon: Icons.photo_camera_back_rounded,
                      text: "Gallery"
                  ),
                ],
              ),

              const SizedBox(height: 15,),
            ],
          );
        }
    );
  }

  pickImageFromCamera() async{
    Navigator.of(context).pop();
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera=File(image!.path);
        imageGallery = null;
      });
    }catch(e){
      showAlertDialog(context: context, message: e.toString());
    }
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
}){
    return Column(
      children: [
        CustomIconButton(
          onTap: onTap,
          icon: icon,
          iconcolor: Coloors.greenDark,
          minWidth: 50,
          border: Border.all(
            color: context.theme.greyColor!.withOpacity(0.2),
            width: 1,
          ),
        ),

        const SizedBox(height: 5,),

        Text(
          text,
          style: TextStyle(
            color: context.theme.greyColor,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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

            GestureDetector(
              onTap: imagePickerTypeBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.photoIconBgColor,
                  border: Border.all(
                    color: imageCamera == null && imageGallery == null
                        ? Colors.transparent
                        : context.theme.greyColor!.withOpacity(0.4),
                  ),
                  image: imageCamera != null || imageGallery != null
                    ? DecorationImage(
                      fit: BoxFit.cover,
                      image: imageGallery !=null
                      ? MemoryImage(imageGallery!) as ImageProvider
                      : FileImage(imageCamera!),
                      )
                    : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0,right: 3),
                  child: Icon(Icons.add_a_photo_rounded,
                    size: 48,
                    color: imageCamera == null && imageGallery == null
                    ? context.theme.photoIconColor
                    : Colors.transparent,

                  ),
                ),
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
                      controller: usernameController,
                      autofocus: true,
                      style: const TextStyle(
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
          onPressed: saveUserDataToFirebase,
          text: 'Next',
          buttonWidth: 90,
          mright: 3,
      ),
    );
  }
}
