import 'dart:io';

import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/dashboard/dashboard_controller.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/screens/about_us/about_us_screen.dart';
import 'package:damacalculator/screens/contact_us/contact_us_screen.dart';
import 'package:damacalculator/screens/fabric_costing/fabric_costing_screen.dart';
import 'package:damacalculator/screens/labour_work/labour_work_screen.dart';
import 'package:damacalculator/screens/production/production_screen.dart';
import 'package:damacalculator/screens/setting/setting_screen.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DashboardController  controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorRes.themColor,
        title: controller.index.value == 0 ?  Text(StringRes.productionCalculation.tr)
             : controller.index.value == 1 ?  Text(StringRes.fabricCosting.tr)
            : controller.index.value == 2 ?  Text(StringRes.labourWork.tr)
            : controller.index.value == 3 ?  Text(StringRes.aboutUs.tr)
            : controller.index.value == 4 ?  Text(StringRes.contactUs.tr)
            : controller.index.value == 5 ?  Text(StringRes.setting.tr) :   Text(StringRes.productionCalculation.tr) ,
        titleTextStyle: const TextStyle(color: ColorRes.white, fontSize: 18),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            _scaffoldKey.currentState?.openDrawer();
          },
          child: const Icon(Icons.menu_rounded, color: Colors.white),
        ),
      ),
      drawer: Drawer(

        child: Obx(() => ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorRes.themColor,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const SizedBox(height: 10),
                    const Icon(Icons.account_circle, color: Colors.white, size: 80),
                    const SizedBox(height: 10),
                    Text(PrefService.getString(PrefKeys.userName).isEmpty ? "User name" : PrefService.getString(PrefKeys.userName), style: const TextStyle(color: Colors.white),)
                  ],
                )
            ),
            ListTile(
              title:  Text(StringRes.productionCalculation.tr,
                style: controller.index.value == 0
                    ? const TextStyle(
                    color: ColorRes.themColor,
                    fontWeight: FontWeight.w500, fontSize: 18)
                    : const TextStyle(
                  color: ColorRes.grey,
                    fontSize: 18
                ),
              ),
              onTap: () {
                controller.index.value = 0;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.fabricCosting.tr,
                style: controller.index.value == 1
                    ? const TextStyle(
                    color: ColorRes.themColor,
                    fontWeight: FontWeight.w500, fontSize: 18)
                    : const TextStyle(
                    color: ColorRes.grey,
                    fontSize: 18
                ),
              ),
              onTap: () {
                controller.index.value = 1;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.labourWork.tr,
                style: controller.index.value == 2 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500,fontSize: 18)
                    : const TextStyle(color:   ColorRes.grey,fontSize: 18),
              ),
              onTap: () {
                controller.index.value = 2;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.aboutUs.tr,
                style: controller.index.value == 3 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500, fontSize: 18)
                    : const TextStyle(color:   ColorRes.grey,fontSize: 18),
              ),
              onTap: () {
                controller.index.value = 3;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.contactUs.tr,
                style: controller.index.value == 4 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500, fontSize: 18)
                    : const TextStyle(color:   ColorRes.grey, fontSize: 18),
              ),
              onTap: () {
                controller.index.value = 4;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.setting.tr,
                style: controller.index.value == 5 ? const TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500, fontSize: 18)
                    : const TextStyle(color:   ColorRes.grey,fontSize: 18),
              ),
              onTap: () {
                controller.index.value = 5;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),

            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: InkWell(
            //       onTap: (){
            //         PrefService.setValue(PrefKeys.isLogin, false);
            //         Get.offAll(LoginScreen());
            //       },
            //         child: Text("Logout", style: TextStyle(fontSize: 18, color: ColorRes.themColor, fontWeight: FontWeight.w600),))
            //   ),
            // ),
            const SizedBox(height: 20),
          ],
        )),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title:  Text("Are you sure you want exit app ?".tr, style: const TextStyle(fontSize: 20, color: Colors.black)),
                  actions: <Widget>[
                    TextButton(
                      child:  Text("No".tr,style: const TextStyle(fontSize: 18, color: Colors.black)),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child:  Text("Yes".tr, style: const TextStyle(fontSize: 18, color: Colors.black)),
                      onPressed: () {
                        exit(0);
                      },
                    )
                  ],
                );
              });


          return false;
        },

        child: Obx(
            ()=> SafeArea(
            child: controller.index.value == 0 ? Production()
                : controller.index.value == 1 ?  FabricCostingScreen()
                : controller.index.value == 2 ?  controller.isLogin.value ? LabourWork() : LoginScreen()
                : controller.index.value == 3 ? const AboutUs()
                : controller.index.value == 4 ? const ContactUs()
                : controller.index.value == 5 ? Setting() : Production() ,
          ),
        ),
      ),
    ));
  }
}
