import 'package:flutter/material.dart';
import 'package:my_whatsapp/Model/colors.dart';

extension ExtendedTheme on BuildContext{
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension>{

  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighLightColor;
  final Color? loginAppbarTextColor;
  final Color? blackwhiteColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;
  final Color? authAppbarTextColor;

  const CustomThemeExtension({
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighLightColor,
    this.loginAppbarTextColor,
    this.blackwhiteColor,
    this.photoIconBgColor,
    this.photoIconColor,
    this.authAppbarTextColor,
  });

  static const lightMode = CustomThemeExtension(
    circleImageColor : Color(0xFF25D366),
    greyColor : Coloors.greyLight,
    blueColor : Coloors.blueLight,
    langBtnBgColor : Color(0xFFF7F8FA),
    langBtnHighLightColor : Color(0xFFE8E8Ed),
    loginAppbarTextColor: Coloors.greenLight,
    blackwhiteColor: Colors.black,
    photoIconBgColor: Color(0xFFF0F2F3),
    photoIconColor: Color(0xFF9DAAB3),
    authAppbarTextColor: Coloors.greenLight,

  );

  static const darkMode = CustomThemeExtension(
    circleImageColor : Coloors.greenDark,
    greyColor : Coloors.greyDark,
    blueColor : Coloors.blueDark,
    langBtnBgColor : Color(0xFF182229),
    langBtnHighLightColor : Color(0xFF09141A),
    loginAppbarTextColor: Color(0xFFE9EDEF),
    blackwhiteColor: Color(0xFFE9EDEF),
    photoIconBgColor: Color(0xFF283339),
    photoIconColor: Color(0xFF61717B),
    authAppbarTextColor: Color(0xFFE9EDEF),

  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith(
      {
        Color? circleImageColor,
        Color? greyColor,
        Color? blueColor,
        Color? langBtnBgColor,
        Color? langBtnHighLightColor,
        Color? loginAppbarTextColor,
        Color? blackwhiteColor,
        Color? photoIconBgColor,
        Color? photoIconColor,
        Color? authAppbarTextColor,
      }
  ) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighLightColor: langBtnHighLightColor ?? this.langBtnHighLightColor,
      loginAppbarTextColor: loginAppbarTextColor?? this.loginAppbarTextColor,
      blackwhiteColor: blackwhiteColor?? this.blackwhiteColor,
      photoIconBgColor: photoIconBgColor?? this.photoIconBgColor,
      photoIconColor: photoIconColor?? this.photoIconColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if(other is! CustomThemeExtension )return this;
    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighLightColor: Color.lerp(langBtnHighLightColor, other.langBtnHighLightColor, t),
      loginAppbarTextColor: Color.lerp(loginAppbarTextColor, other.loginAppbarTextColor, t),
      blackwhiteColor: Color.lerp(blackwhiteColor, other.blackwhiteColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      authAppbarTextColor: Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
    );
  }
  
}