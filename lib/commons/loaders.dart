import 'package:damacalculator/utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullLoader extends StatelessWidget {
  const FullLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  const CircularProgressIndicator(color: ColorRes.themColor),
    );
  }
}
