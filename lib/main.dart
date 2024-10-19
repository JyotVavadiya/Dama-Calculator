import 'package:damacalculator/localization/app_localization.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/splash/splash_screen.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCLw0m2dxqZlUbz9z-BLjZLUQB3FFefHe4",
          projectId: "damacalculator",
          storageBucket: "damacalculator.appspot.com",
          messagingSenderId: "389038085530",
          appId: "1:389038085530:android:d3aa30da3722dd39f31623",

      )
  );
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
        locale: (PrefService.getString(PrefKeys.languageCode).isEmpty || PrefService.getString(PrefKeys.countryCode).isEmpty) ?  Locale('en', 'US') :  Locale(PrefService.getString(PrefKeys.languageCode), PrefService.getString(PrefKeys.countryCode)), // Default locale
        fallbackLocale: Locale('en', 'US'),
    );
  }
}


