import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damacalculator/dashboard/dashboard_controller.dart';
import 'package:damacalculator/screens/labour_work/labour_work_controller.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController{

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  RxBool loader = false.obs;


  Rx<bool> isShowPassword = true.obs;



  String passwordError = '';

  String emailError = '';

  bool isUser = true;

  Future<void> onTapPickDatePlayer({required BuildContext context}) async {
    update(["player"]);
  }



  signUp(email, pwd, userName, phone, dob) async {

    loader.value = true;
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );

      Map<String, dynamic> map2 = {
        "uid": credential.user?.uid.toString(),
        "email": email,
        "userName": userName,
        "phone": phone,
        "DOB": dob
      };

      await PrefService.setValue(PrefKeys.email, email);
      await PrefService.setValue(PrefKeys.uid, credential.user?.uid.toString());
      await PrefService.setValue(PrefKeys.userName, userName);

      addDataInFirebase(userUid: credential.user?.uid ?? "", map: map2);


    } on FirebaseAuthException catch (e) {
      loader.value = false;
      if (e.code == 'weak-password') {
        Get.snackbar(  'Error',  // Title
          'The password provided is too weak!',  // Message
          snackPosition: SnackPosition.TOP,  // Position at the bottom
          backgroundColor: Colors.red,  // Background color
          colorText: Colors.white,  // Text color
          duration: Duration(seconds: 2), );

      } else if (e.code == 'email-already-in-use') {

        Get.snackbar(  'Error',  // Title
          'The account already exists for that email!',  // Message
          snackPosition: SnackPosition.TOP,  // Position at the bottom
          backgroundColor: Colors.red,  // Background color
          colorText: Colors.white,  // Text color
          duration: Duration(seconds: 2), );
      }else{
        Get.snackbar(  'Error',  // Title
          '${e.code}',  // Message
          snackPosition: SnackPosition.TOP,  // Position at the bottom
          backgroundColor: Colors.red,  // Background color
          colorText: Colors.white,  // Text color
          duration: Duration(seconds: 2), );
      }
    } catch (e) {
      loader.value = false;
      Get.snackbar(  'Error',  // Title
        '$e',  // Message
        snackPosition: SnackPosition.TOP,  // Position at the bottom
        backgroundColor: Colors.red,  // Background color
        colorText: Colors.white,  // Text color
        duration: Duration(seconds: 2), );
    }
  }

  addDataInFirebase(
      {required String userUid, required Map<String, dynamic> map}) async {

    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    await fireStore.collection("Auth").doc(userUid).set(map);


    Get.back();

    PrefService.setValue(PrefKeys.isLogin, true);

    DashboardController  dashboardController = Get.put(DashboardController());
    dashboardController.isLogin.value = PrefService.getBool(PrefKeys.isLogin);

    loader.value = false;

    //Get.to(()=>const DashboardScreen());

  }

}