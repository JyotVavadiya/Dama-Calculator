import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/commons/loaders.dart';
import 'package:damacalculator/commons/text_filled.dart';
import 'package:damacalculator/commons/validation_functions.dart';
import 'package:damacalculator/dashboard/dashboard_screen.dart';
import 'package:damacalculator/login/login_controller.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/signUP/signup_screen.dart';
import 'package:damacalculator/utils/assets_res.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                           Text(
                            StringRes.login.tr,
                            style: TextStyle(
                                fontSize: 30,
                                color: ColorRes.themColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           Text(
                            StringRes.loginMsg.tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorRes.hint,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 40
                          ),
                          ///  ---------- email text field
                          CustomTextFormField(
                              controller: loginController.emailController,
                              hintText: StringRes.email.tr,
                              textInputType: TextInputType.emailAddress,

                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email address.".tr;
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20
                          ),

                          ///  ---------- password text field
                          Obx(() => CustomTextFormField(
                              controller: loginController.passwordController,
                              hintText: StringRes.password.tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: GestureDetector(
                                  onTap: () {
                                    loginController.isShowPassword.value =
                                    !loginController.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          30, 18, 18, 18),
                                      child: Container(

                          child: SvgPicture.asset(
                                    !loginController.isShowPassword.value?AssetRes.imgIcEye:AssetRes.imgIcEyeClose,
                          height: 20,
                          width: 20,

                          color: ColorRes.grey,
                          ),
                          ),),),


                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter valid password.".tr;
                                }
                                return null;
                              },
                              obscureText: loginController.isShowPassword.value,
                              contentPadding: const EdgeInsets.only(
                                  left: 16))),
                          const SizedBox(
                              height: 40
                          ),

                          ///------ login button
                          CustomElevatedButton(
                              text: StringRes.login.tr,
                              onPressed: loginController.loader.value ? (){} : () async{
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {

                                 await loginController.signIn(loginController.emailController.text, loginController.passwordController.text);



                                }

                              }),

                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Padding(
                                    padding: EdgeInsets.only(bottom: 1),
                                    child: Text(StringRes.doNotAccount.tr, style: TextStyle( color: ColorRes.grey))),
                                GestureDetector(
                                    onTap: () {
                                          Get.to(()=>SignupScreen());
                                    },
                                    child:  Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text(StringRes.signUp.tr, style: TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500))))
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              loginController.loader.value == true ? const FullLoader() : const SizedBox()
            ],
          );
        }),

      ),
    );
  }
}
