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






}