import 'package:damacalculator/dashboard/dashboard_controller.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/screens/edit_profile/edit_profile_screen.dart';
import 'package:damacalculator/screens/setting/setting_controller.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:damacalculator/utils/string_res.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Setting extends StatelessWidget {
   Setting({super.key});

   final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 40),
         GestureDetector(
           onTap: (){
             Get.to(()=>EditProfileScreen());
           },
           child: Container(
             height: 45,
             width: Get.width,
             padding: const EdgeInsets.symmetric(horizontal: 20),
             alignment: Alignment.centerLeft,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),

               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.3),
                   spreadRadius: 2,
                   blurRadius: 5,
                   offset: const Offset(0, 3), // changes position of shadow
                 ),
               ],
             ),
             child:  Row(
               children: [
                 Text(StringRes.editProfile.tr, style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 16)),
                 const Spacer(),
                 Icon(Icons.edit_outlined, color: Colors.black.withOpacity(0.7),)
               ],
             )
           ),
         ),
          const SizedBox(height: 20),

          InkWell(
            onTap: (){
              settingController.languageDrop.value = !settingController.languageDrop.value;
            },
            child: Obx(
                ()=> Container(
                  height: 45,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:  Row(
                    children: [
                      Text(StringRes.selectLanguage.tr, style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 16)),
                      const Spacer(),
                      settingController.languageDrop.value ?
                      Icon(Icons.keyboard_arrow_up_outlined, color: Colors.black.withOpacity(0.7),)
                          : Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black.withOpacity(0.7),)
                    ],
                  )
              ),
            ),
          ),
        Obx(() => settingController.languageDrop.value ? const SizedBox(height: 10): const SizedBox(),),
          Obx(
            ()=> settingController.languageDrop.value
                ? Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorRes.themColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      settingController.index.value = 0;
                      settingController.languageDrop.value = false;

                      var locale = Locale('en', 'US'); // Set to English
                      Get.updateLocale(locale);
                    },
                      child: Container(
                        width: Get.width,
                          child: Text(StringRes.english.tr, style: settingController.index.value == 0 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500) : const TextStyle(color: ColorRes.grey),))),
                  const SizedBox(height: 7,),
                  Divider(thickness: 1, color: Colors.grey.withOpacity(0.4),),
                  const SizedBox(height: 7,),
                  InkWell(
                      onTap: (){
                        settingController.index.value = 1;
                        settingController.languageDrop.value = false;
                        var locale = Locale('hi', 'IN'); // Set to Gujarati
                        Get.updateLocale(locale);
                      },
                      child: Container(
                        width: Get.width,
                          child: Text(StringRes.hindi.tr, style:  settingController.index.value == 1 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500) :const TextStyle(color: ColorRes.grey),))),
                  const SizedBox(height: 7,),
                  Divider(thickness: 1, color: Colors.grey.withOpacity(0.4),),
                  const SizedBox(height: 7,),
                  InkWell(
                      onTap: (){
                        settingController.index.value = 2;
                        settingController.languageDrop.value = false;

                        var locale = Locale('gu', 'IN'); // Set to Gujarati
                        Get.updateLocale(locale); //

                      },
                      child: SizedBox(
                          width: Get.width,
                          child: Text(StringRes.gujarati.tr, style:  settingController.index.value == 2 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500) :const TextStyle(color: ColorRes.grey),)))
                ],
              ),
            )
                : const SizedBox(),
          ),

          const SizedBox(height: 20),

          GestureDetector(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title:  Text("Are you sure you want log out ?".tr, style: TextStyle(fontSize: 20, color: Colors.black)),
                      actions: <Widget>[
                        TextButton(
                          child:  Text("No".tr,style: TextStyle(fontSize: 18, color: Colors.black)),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextButton(
                          child:  Text("Yes".tr, style: TextStyle(fontSize: 18, color: Colors.black)),
                          onPressed: () {
                             PrefService.setValue(PrefKeys.isLogin, false);
                             //Get.offAll(LoginScreen());
                            DashboardController dashboardController = Get.put(DashboardController());
                            dashboardController.index.value = 2;
                            Get.back();
                          },
                        )
                      ],
                    );
                  });
            },
            child: Container(
                height: 45,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:  Row(
                  children: [
                    Text(StringRes.logOut.tr, style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 16)),
                    const Spacer(),
                    Icon(Icons.logout_rounded, color: Colors.black.withOpacity(0.7),)
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
