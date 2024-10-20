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
          apiKey: "AIzaSyDzfECx32LpqfZZTC9Vu4ptckcdRyK_9Kk",
          authDomain: "damacalculator.firebaseapp.com",
          projectId: "damacalculator",
          storageBucket: "damacalculator.appspot.com",
          messagingSenderId: "389038085530",
          appId: "1:389038085530:web:f414537d7ef8f0bcf31623",
          measurementId: "G-DSZ8BSFBSD"
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


