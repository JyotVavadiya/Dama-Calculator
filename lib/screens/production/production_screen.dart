import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/screens/production/production_controller.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Production extends StatelessWidget {
   Production({super.key});

final ProductionController controller = Get.put(ProductionController());
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),

              Text("RPM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.themColor),),
              SizedBox(height: 20),
              rmp(),
              CustomElevatedButton(
                text: StringRes.calculate,
                onPressed: (){
                  if (_formKey.currentState!.validate()) {

                  } else{

                  }
                },
              ),
              SizedBox(height: 20),
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Result :- ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: ColorRes.black),),

                Text("0.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.themColor),),
              ],
            ),
              SizedBox(height: 20),
              Text("Note: If you know Loom Speed (RPM) then do direct calculation by entering the RPM below. ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: ColorRes.black.withOpacity(0.7)),
              ),


            ],
          ),
        ),
      ),
    );
  }
  Widget rmp(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(StringRes.motorRPM, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
              SizedBox(height: 5),
              CustomTextFormField(
                  width: Get.width * 0.4,
                  controller: controller.reedController,
                  hintText: StringRes.enterMotorRPM,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter motor RPM";
                    }
                    return null;
                  }),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(StringRes.pulleyDiameter, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
              SizedBox(height: 5),
              CustomTextFormField(
                  width: Get.width*0.45,
                  controller: controller.pickController,
                  hintText: StringRes.enterPulleyDiameter,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter pulley Diameter";
                    }
                    return null;
                  }),
            ],
          ),
        ],
      ),


        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(StringRes.loomPulleyDiameter, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
        SizedBox(height: 5),
        CustomTextFormField(
            controller: controller.timeController,
            hintText: StringRes.enterLoomPulleyDiameter,
            textInputType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter loom pulley diameter";
              }
              return null;
            }),
        SizedBox(height: 20),
      ],
    );
  }
}
