import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FullLoader extends StatelessWidget {
  const FullLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Center(
        child: Platform.isIOS
            ? const CircularProgressIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}
