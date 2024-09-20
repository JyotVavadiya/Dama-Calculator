import 'package:damacalculator/dashboard/dashboard_screen.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/splash/splash_screen.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Dama Calculator',
        debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}


