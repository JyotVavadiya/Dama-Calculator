import 'package:damacalculator/screens/labour_work/labour_work_controller.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loader = false.obs;

  Rx<bool> isShowPassword = true.obs;

  String passwordError = '';

  String emailError = '';

  bool isUser = true;

  signIn(email, pwd) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pwd
      );

      await PrefService.setValue(PrefKeys.email, email);
      await PrefService.setValue(PrefKeys.uid, credential.user?.uid.toString());

      //Get.to(const DashboardScreen());
      PrefService.setValue(PrefKeys.isLogin, true);

      LabourWorkController labourWorkController = Get.put(LabourWorkController());
      labourWorkController.isLogin.value = PrefService.getBool(PrefKeys.isLogin);

    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found') {
        Get.snackbar(  'Error',  // Title
          'No user found for that email!',  // Message
          snackPosition: SnackPosition.TOP,  // Position at the bottom
          backgroundColor: Colors.red,  // Background color
          colorText: Colors.white,  // Text color
          duration: Duration(seconds: 2), );

      } else if (e.code == 'wrong-password') {
        Get.snackbar(  'Error',  // Title
          'Wrong password provided for that user!',  // Message
          snackPosition: SnackPosition.TOP,  // Position at the bottom
          backgroundColor: Colors.red,  // Background color
          colorText: Colors.white,  // Text color
          duration: Duration(seconds: 2), );

      } else{
        Get.snackbar(  'Error',  // Title
          '${e.code}',  // Message
          snackPosition: SnackPosition.TOP,  // Position at the bottom
          backgroundColor: Colors.red,  // Background color
          colorText: Colors.white,  // Text color
          duration: Duration(seconds: 2), );
      }
    }




  }




}