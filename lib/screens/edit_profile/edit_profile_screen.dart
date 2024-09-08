import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/commons/loaders.dart';

import 'package:damacalculator/commons/validation_functions.dart';
import 'package:damacalculator/dashboard/dashboard_screen.dart';

import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/screens/edit_profile/edit_profile_controller.dart';
import 'package:damacalculator/service/pref_services.dart';

import 'package:damacalculator/utils/assets_res.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final EditProfileController controller = Get.put(EditProfileController());
  GlobalKey<FormState> _signupformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _signupformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                         Row(
                           children: [
                             GestureDetector(
                               onTap: (){
                                 Get.back();
                               },
                                 child: Icon(Icons.arrow_back_rounded, color: ColorRes.themColor)),
                             SizedBox(width: 20,),
                             const Text(
                               StringRes.editProfile,
                               style: TextStyle(
                                   fontSize: 25,
                                   color: ColorRes.themColor,
                                   fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),

                          const SizedBox(height: 40),

                          ///  ---------- username field
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                              child: Text(StringRes.userName, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                          SizedBox(height: 5),
                          CustomTextFormField(
                              controller: controller.userNameController,
                              hintText: StringRes.userName,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter user name";
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),

                          ///  ---------- phone field
                             Padding(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Text(StringRes.mobileNumber, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                                                   SizedBox(height: 5),
                          CustomTextFormField(
                              controller: controller.mobileNumberController,
                              textInputType: TextInputType.phone,
                              hintText: StringRes.mobileNumber,
                              validator: (value) {
                                if (!isNumeric(value) ||
                                    value!.isEmpty ||
                                    value.length != 10) {
                                  return "Please enter valid number";
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),

                          ///  ---------- date of birth field

                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(StringRes.dateOfBirth, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                          SizedBox(height: 5),
                             CustomTextFormField(
                                controller: controller.dateOfBirthController,
                                hintText: StringRes.dateOfBirth,
                                enable: false,
                                readOnly: true,
                                onTap: () async{
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    lastDate: DateTime.now(),
                                    firstDate: DateTime(1980),
                                    initialDate: DateTime.now(),
                                  );
                                  if (pickedDate == null) return;
                                  controller.dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please select date of birth".tr;
                                  }
                                  return null;
                                }),

                          const SizedBox(height: 20),

                          ///  ---------- email text field
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(StringRes.email, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                          SizedBox(height: 5),
                          CustomTextFormField(
                              controller: controller.emailController,
                              hintText: StringRes.email,
                              textInputType: TextInputType.emailAddress,
                              fillColor: Colors.grey.withOpacity(0.3),
                              enable: false,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email address.";
                                }
                                return null;
                              }),




                          const SizedBox(height: 40),

                          ///------ signup button
                          CustomElevatedButton(
                              text: StringRes.update,
                              onPressed: ()  {
                                      if (_signupformKey.currentState!.validate()) {
                                      Get.back();

                                      }
                                    }),

                          const SizedBox(height: 20),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              controller.loader.value == true
                  ? const FullLoader()
                  : const SizedBox()
            ],
          );
        }),
      ),
    );
  }
}
