import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                PrefService.setValue(PrefKeys.isLogin, false);
                Get.offAll(LoginScreen());
              },
                child: Text("log out"))
          ],
        ),
      ),
    );
  }
}
