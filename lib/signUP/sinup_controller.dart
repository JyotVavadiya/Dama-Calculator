import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1980),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    update(["player"]);
  }



}