import 'package:damacalculator/localization/app_localization.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/splash/splash_screen.dart';
import 'package:damacalculator/utils/string_res.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init();

  runApp(
     MyApp());
}



class MyApp extends StatelessWidget {


  const MyApp({super.key});

  


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Dama Calculator',
        debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      translations: AppLocalization(), // Add the translations
        locale: Locale('en', 'US'), // Default locale
        fallbackLocale: Locale('en', 'US'),
    );
  }
}


