import 'dart:io';

import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/dashboard/dashboard_controller.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/screens/about_us/about_us_screen.dart';
import 'package:damacalculator/screens/contact_us/contact_us_screen.dart';
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
        title: controller.index.value == 0 ? Text(StringRes.productionCalculation)
            : controller.index.value == 1 ? Text(StringRes.labourWork)
            : controller.index.value == 2 ? Text(StringRes.aboutUs)
            : controller.index.value == 3 ? Text(StringRes.contactUs)
            : controller.index.value == 4 ? Text(StringRes.setting) :  Text(StringRes.productionCalculation) ,
        titleTextStyle: TextStyle(color: ColorRes.white, fontSize: 18),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(Icons.menu_rounded, color: Colors.white),
        ),
      ),
      drawer: Drawer(

        child: Obx(() => ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorRes.themColor,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    SizedBox(height: 10),
                    Icon(Icons.account_circle, color: Colors.white, size: 80),
                    SizedBox(height: 10),
                    Text("User name", style: TextStyle(color: Colors.white),)
                  ],
                )
            ),
            ListTile(
              title:  Text(StringRes.productionCalculation,
                style: controller.index.value == 0
                    ? TextStyle(
                    color: ColorRes.themColor,
                    fontWeight: FontWeight.w500)
                    : TextStyle(
                  color: ColorRes.grey,
                ),
              ),
              onTap: () {
                controller.index.value = 0;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.labourWork,
                style: controller.index.value == 1 ? TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500)
                    : TextStyle(color:   ColorRes.grey,),
              ),
              onTap: () {
                controller.index.value = 1;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.aboutUs,
                style: controller.index.value == 2 ? TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500)
                    : TextStyle(color:   ColorRes.grey,),
              ),
              onTap: () {
                controller.index.value = 2;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.contactUs,
                style: controller.index.value == 3 ? TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500)
                    : TextStyle(color:   ColorRes.grey,),
              ),
              onTap: () {
                controller.index.value = 3;
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title:  Text(StringRes.setting,
                style: controller.index.value == 4 ? TextStyle(color: ColorRes.themColor, fontWeight: FontWeight.w500)
                    : TextStyle(color:   ColorRes.grey,),
              ),
              onTap: () {
                controller.index.value = 4;
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
            SizedBox(height: 20),
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
                  title: Text("Are you sure you want exit app ?", style: TextStyle(fontSize: 20, color: Colors.black)),
                  actions: <Widget>[
                    TextButton(
                      child: Text("No",style: TextStyle(fontSize: 18, color: Colors.black)),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text("Yes", style: TextStyle(fontSize: 18, color: Colors.black)),
                      onPressed: () {
                        exit(0);
                      },
                    )
                  ],
                );
              });


          return false;
        },

        child: SafeArea(
          child: controller.index.value == 0 ? Production()
              : controller.index.value == 1 ? LabourWork()
              : controller.index.value == 2 ? AboutUs()
              : controller.index.value == 3 ? ContactUs()
              : controller.index.value == 4 ? Setting() : Production() ,
        ),
      ),
    ));
  }
}
