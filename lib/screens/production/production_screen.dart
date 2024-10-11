import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/screens/production/production_controller.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
            Text("Note: If you know Loom Speed (RPM) then do direct calculation by entering the RPM below.".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: ColorRes.black.withOpacity(0.7)),
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 15),
             Text("Production On 1 Loom".tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.themColor),),
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
                      child: Text(StringRes.motorRPM.tr, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 2.5,
                      controller: controller.motorRPMController,
                      hintText: StringRes.enterMotorRPM.tr,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter motor RPM".tr;
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
                      child: Text(StringRes.pulleyDiameter.tr, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 2.5,
                      controller: controller.pdController,
                      hintText: StringRes.enterPulleyDiameter.tr,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter pulley Diameter".tr;
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
              child: Text(StringRes.loomPulleyDiameter.tr, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
          const SizedBox(height: 5),
          CustomTextFormField(
              controller: controller.lpdController,
              hintText: StringRes.enterLoomPulleyDiameter.tr,
              textInputType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter loom pulley diameter".tr;
                }
                return null;
              }),
          const SizedBox(height: 20),
          Row(
            children: [
              InkWell(
                onTap: (){
                  if (_formKey.currentState!.validate()) {

                     controller.rpm.value = double.parse(controller.motorRPMController.text) *  double.parse(controller.pdController.text)  / double.parse(controller.lpdController.text);

                     controller.rpmController.value.text =   controller.rpm.toStringAsFixed(2).toString();

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
                  child:  Text(StringRes.calculate.tr, style: TextStyle(color: ColorRes.white, fontSize: 18, fontWeight: FontWeight.w500),),

                ),
              ),

              const SizedBox(width: 30),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Result :- ".tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: ColorRes.themColor),),

                  Obx(()=> Text("${controller.rpm.value.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.black),)),
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
                      child: Text(StringRes.RPM.tr, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  Obx(
    ()=> CustomTextFormField(
                        width: Get.width / 3.5,
                        controller: controller.rpmController.value,
                        hintText: StringRes.enterRPM.tr,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter RPM".tr;
                          }
                          return null;
                        }),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(StringRes.pick.tr, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 3.5,
                      controller: controller.pickController,
                      hintText: StringRes.enterPick.tr,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter pick".tr;
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
                      child: Text(StringRes.efficiency.tr, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                      width: Get.width / 3.5,
                      controller: controller.efficiencyController,
                      hintText: StringRes.enterEfficiency.tr,
                      textInputType: TextInputType.number,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter efficiency".tr;
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


                    var e = double.parse(controller.efficiencyController.text)/100;


                    controller.production.value =
                        (double.parse(controller.rpmController.value.text) * 60 *24)/(double.parse(controller.pickController.text)  * 39.37) * e  ;



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
                  child:  Text(StringRes.calculate.tr, style: TextStyle(color: ColorRes.white, fontSize: 18, fontWeight: FontWeight.w500),),

                ),
              ),

              const SizedBox(width: 30),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Result :- ".tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: ColorRes.themColor),),

                  Obx(()=> Text("${controller.production.value.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorRes.black),)),
                ],
              ),           ],
          ),
        ],
      ),
    );
  }
}
