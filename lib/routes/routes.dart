import 'package:flutter/material.dart';
import 'package:my_whatsapp/Pages/LoginPage.dart';
import 'package:my_whatsapp/Pages/VerifyCodeSMSPage.dart';
import 'package:my_whatsapp/Pages/WelcomePage.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case login:
        return MaterialPageRoute(builder: (context)=> const LoginPage());
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context)=>
            VerifyCodeSMSPage(
              verificationId: args['verificationId'],
              phoneNumber: args['phoneNumber'],
            ));
      case userInfo:
        return MaterialPageRoute(builder: (context)=> const WelcomePage());
      case welcome:
        return MaterialPageRoute(builder: (context)=> const WelcomePage());
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