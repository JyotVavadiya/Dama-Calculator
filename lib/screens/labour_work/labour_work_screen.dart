import 'dart:ffi';

import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/screens/labour_work/labour_work_controller.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabourWork extends StatelessWidget {
   LabourWork({super.key});

   LabourWorkController controller = Get.put(LabourWorkController());

  @override
  Widget build(BuildContext context) {

    return Obx(() => controller.isLogin.value ? Center(child: Text("HELLOW WORLD"),) : LoginScreen());
  }
}
