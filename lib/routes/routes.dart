import 'package:flutter/material.dart';
import 'package:my_whatsapp/Pages/HomePage.dart';
import 'package:my_whatsapp/Pages/LoginPage.dart';
import 'package:my_whatsapp/Pages/UserInfoPage.dart';
import 'package:my_whatsapp/Pages/VerifyPhoneNumberPage.dart';
import 'package:my_whatsapp/Pages/WelcomePage.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';
  static const String home= 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case login:
        return MaterialPageRoute(builder: (context)=> const LoginPage());
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context)=>
          VerifyPhoneNumberPage(
            smsCodeId: args['smsCodeId'],
            phoneNumber: args['phoneNumber'],
          )
        );
      case userInfo:
        return MaterialPageRoute(builder: (context)=> const UserInfoPage());
      case welcome:
        return MaterialPageRoute(builder: (context)=> const WelcomePage());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Page Route Provided."),
            ),
          ),
        );
    }
  }
}