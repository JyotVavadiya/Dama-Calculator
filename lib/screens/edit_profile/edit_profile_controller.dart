import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  RxBool loader = false.obs;

  @override
  void onInit() {
    init();

    super.onInit();
  }


init()async{

  if(PrefService.getBool(PrefKeys.isLogin)){
    loader.value = true;

    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentSnapshot document =   await fireStore.collection("Auth").doc(PrefService.getString(PrefKeys.uid)).get();

    Map<String, dynamic> data = document.data() as Map<String, dynamic>;


    userNameController.text = data["userName"];
    emailController.text = data["email"];
    mobileNumberController.text = data["phone"];
    dateOfBirthController.text = data["DOB"];
    loader.value = false;
  }


}









}