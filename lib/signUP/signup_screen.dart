import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/commons/loaders.dart';
import 'package:damacalculator/commons/text_filled.dart';
import 'package:damacalculator/commons/validation_functions.dart';
import 'package:damacalculator/dashboard/dashboard_screen.dart';
import 'package:damacalculator/login/login_controller.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/signUP/sinup_controller.dart';
import 'package:damacalculator/utils/assets_res.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignUpController controller = Get.put(SignUpController());
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
                          Text(
                            StringRes.signUp.tr,
                            style: TextStyle(
                                fontSize: 30,
                                color: ColorRes.themColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            StringRes.signUpMsg.tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorRes.hint,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 40),

                          ///  ---------- username field
                          CustomTextFormField(
                              controller: controller.userNameController,
                              hintText: StringRes.userName.tr,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter user name".tr;
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),

                          ///  ---------- phone field
                          CustomTextFormField(
                              controller: controller.mobileNumberController,
                              textInputType: TextInputType.phone,
                              hintText: StringRes.mobileNumber.tr,
                              validator: (value) {
                                if (!isNumeric(value) ||
                                    value!.isEmpty ||
                                    value.length != 10) {
                                  return "Please enter valid number".tr;
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),

                          ///  ---------- date of birth field

                          CustomTextFormField(
                              controller: controller.dateOfBirthController,
                              hintText: StringRes.dateOfBirth.tr,
                              enable: false,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  lastDate: DateTime.now(),
                                  firstDate: DateTime(1980),
                                  initialDate: DateTime.now(),
                                );
                                if (pickedDate == null) return;
                                controller.dateOfBirthController.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please select date of birth".tr;
                                }
                                return null;
                              }),

                          const SizedBox(height: 20),

                          ///  ---------- email text field
                          CustomTextFormField(
                              controller: controller.emailController,
                              hintText: StringRes.email.tr,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email address.".tr;
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),

                          ///  ---------- password text field
                          Obx(() => CustomTextFormField(
                              controller: controller.passwordController,
                              hintText: StringRes.password.tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: GestureDetector(
                                onTap: () {
                                  controller.isShowPassword.value =
                                      !controller.isShowPassword.value;
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(30, 18, 18, 18),
                                  child: Container(
                                    child: SvgPicture.asset(
                                      !controller.isShowPassword.value
                                          ? AssetRes.imgIcEye
                                          : AssetRes.imgIcEyeClose,
                                      height: 20,
                                      width: 20,
                                      color: ColorRes.grey,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter valid password.".tr;
                                }
                                return null;
                              },
                              obscureText: controller.isShowPassword.value,
                              contentPadding: const EdgeInsets.only(left: 16))),

                          const SizedBox(height: 40),

                          ///------ signup button
                          CustomElevatedButton(
                              text: StringRes.signUp.tr,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                if (_signupformKey.currentState!.validate()) {
                                  await controller.signUp(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                      controller.userNameController.text,
                                      controller.mobileNumberController.text,
                                      controller.dateOfBirthController.text);

                                  controller.userNameController.clear();
                                  controller.mobileNumberController.clear();
                                  controller.dateOfBirthController.clear();
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                }
                              }),

                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 1),
                                    child: Text(StringRes.alreadyAccount.tr,
                                        style:
                                            TextStyle(color: ColorRes.grey))),
                                GestureDetector(
                                    onTap: () {
                                      //Get.to(LoginScreen());
                                      Get.back();
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text(StringRes.login.tr,
                                            style: TextStyle(
                                                color: ColorRes.themColor,
                                                fontWeight: FontWeight.w500))))
                              ])
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
