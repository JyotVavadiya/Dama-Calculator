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
   GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text("RPM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.themColor),),
            const SizedBox(height: 20),
            rmp(),
            const SizedBox(height: 30),
            Text("Note: If you know Loom Speed (RPM) then do direct calculation by entering the RPM below. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: ColorRes.black.withOpacity(0.7)),
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 15),
            const Text("Production On 1 Loom", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.themColor),),
            const SizedBox(height: 30),
            production(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  Widget rmp(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(StringRes.motorRPM, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 2.5,
                      controller: controller.motorRPMController,
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
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(StringRes.pulleyDiameter, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 2.5,
                      controller: controller.pdController,
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


          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(StringRes.loomPulleyDiameter, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
          const SizedBox(height: 5),
          CustomTextFormField(
              controller: controller.lpdController,
              hintText: StringRes.enterLoomPulleyDiameter,
              textInputType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter loom pulley diameter";
                }
                return null;
              }),
          const SizedBox(height: 20),
          Row(
            children: [
              InkWell(
                onTap: (){
                  if (_formKey.currentState!.validate()) {

                  } else {

                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width* 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorRes.themColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(StringRes.calculate, style: TextStyle(color: ColorRes.white, fontSize: 18, fontWeight: FontWeight.w500),),

                ),
              ),

              const SizedBox(width: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Result :- ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: ColorRes.themColor),),

                  Text("0.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.black),),
                ],
              ),           ],
          ),
        ],
      ),
    );
  }

  Widget production(){
    return
    Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(StringRes.RPM, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 3.5,
                      controller: controller.rpmController,
                      hintText: StringRes.enterRPM,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter RPM";
                        }
                        return null;
                      }),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(StringRes.pick, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 3.5,
                      controller: controller.pickController,
                      hintText: StringRes.enterPick,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter pick";
                        }
                        return null;
                      }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(StringRes.efficiency, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 3.5,
                      controller: controller.efficiencyController,
                      hintText: StringRes.enterEfficiency,
                      textInputType: TextInputType.number,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter efficiency";
                        }
                        return null;
                      }),
                ],
              ),
            ],
          ),



          const SizedBox(height: 20),
          Row(
            children: [
              InkWell(
                onTap: (){
                  if (_formKey2.currentState!.validate()) {

                  } else {

                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width* 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorRes.themColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(StringRes.calculate, style: TextStyle(color: ColorRes.white, fontSize: 18, fontWeight: FontWeight.w500),),

                ),
              ),

              const SizedBox(width: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Result :- ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: ColorRes.themColor),),

                  Text("0.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.black),),
                ],
              ),           ],
          ),
        ],
      ),
    );
  }
}
