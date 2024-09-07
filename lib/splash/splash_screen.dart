import 'package:damacalculator/splash/splash_controller.dart';
import 'package:damacalculator/utils/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

   final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Lottie.asset(
            '${AssetRes.splashVideo}',
            fit: BoxFit.fill
        )
      ),
    );
  }
}
