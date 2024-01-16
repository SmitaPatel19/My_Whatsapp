import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/Model/CameraLayout.dart';
import 'package:my_whatsapp/Pages/WelcomePage.dart';
import 'package:my_whatsapp/theme/dark_theme.dart';
import 'package:my_whatsapp/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: AppBarTheme(
      //     color: Color(0xFF075E54),
      //   ),
      //     bottomSheetTheme: BottomSheetThemeData(
      //       backgroundColor: Colors.black.withOpacity(0),
      //     ),
      // ),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      // home: LoginListPage(),
      home: WelcomePage(),
    );
  }
}
