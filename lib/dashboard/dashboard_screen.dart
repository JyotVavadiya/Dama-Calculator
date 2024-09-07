import 'dart:io';

import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/pref_key.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorRes.themColor,
        leading: GestureDetector(
          onTap: (){
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(Icons.menu_rounded, color: Colors.white),
        ),
      ),
      drawer: Drawer(

        child: ListView(
          // Remove any padding from the ListView.
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
                  SizedBox(height: 20),
                  Text("User name", style: TextStyle(color: Colors.white),)
                ],
              )
            ),
            ListTile(
              title: const Text('Production Calculation'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Labour work(Patiya)'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('About us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Contact us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                // Update the state of the app.
                // ...
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
        ),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text("Are you sure you want exit app", style: TextStyle(fontSize: 20, color: Colors.black)),
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
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
