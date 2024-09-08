import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController{

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  @override
  void onInit() {
    userNameController.text = "abc";
    emailController.text = "abc@gmail.com";
    mobileNumberController.text = "3672687683";
    dateOfBirthController.text = "2004-09-23";
    super.onInit();
  }

  RxBool loader = false.obs;











}