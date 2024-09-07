import 'package:damacalculator/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  CustomElevatedButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorRes.themColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: TextStyle(color: ColorRes.white, fontSize: 18, fontWeight: FontWeight.w500),),

      ),
    );
  }
}
