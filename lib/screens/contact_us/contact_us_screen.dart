import 'package:damacalculator/utils/assets_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 40),
           Row(
             children: [
               Image.asset(AssetRes.email, height: 22, color: Colors.black.withOpacity(0.7)),
               SizedBox(width: 20),
               Text("abc@gmail.com", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16),)
             ],
           ),
          SizedBox(height: 20),
          Row(
            children: [
              Image.asset(AssetRes.phone, height: 22, color: Colors.black.withOpacity(0.7)),
              SizedBox(width: 20),
              Text("+913454754637", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16),)
            ],
          ),
          SizedBox(height: 20),
          Row(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetRes.location, height: 22, color: Colors.black.withOpacity(0.7)),
              SizedBox(width: 20),
             SizedBox(

               width: Get.width * 0.78,
               child:  Text("1234 Elm Street, Springfield, IL 62704, USA", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16),),
             ),
            ],
          ),


        ],
      ),
    );
  }
}