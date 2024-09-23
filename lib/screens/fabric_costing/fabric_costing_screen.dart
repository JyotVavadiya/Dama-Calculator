import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/commons/validation_functions.dart';
import 'package:damacalculator/screens/fabric_costing/fabric_costing_controller.dart';
import 'package:damacalculator/utils/color_res.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FabricCostingScreen extends StatelessWidget {
  FabricCostingScreen({super.key});

  final FabricCostingController fabricCostingController = Get.put(FabricCostingController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              feeder(),
              beam(),
            ],
          ),
        ),
      ),
    );
  }

feeder(){
    return SizedBox(
      height: Get.height /2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Row(

            children: [
              Text("${StringRes.selectNumbersOfFeeder} :-", style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w500),),
              SizedBox(width: 10),
              Obx(
                    () => DropdownButton<int>(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(16),
                  focusColor: ColorRes.grey.withOpacity(0.1),
                  underline: SizedBox(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  value: fabricCostingController.dropValueFeeder.value == 0
                      ? null
                      : fabricCostingController.dropValueFeeder.value,
                  hint: const Text("0"), // Hint text
                  items: List.generate(
                    12,
                        (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  onChanged: (value) {
                    fabricCostingController.dropValueFeeder.value = value!;
                    fabricCostingController.updateTextFields(value);
                  },
                ),
              ),
            ],
          ),


          SizedBox(height: 10),
          Obx(
                () =>
            fabricCostingController.dropValueFeeder.value == 0
                ? SizedBox()
            // Center(
            //         child: Text(
            //             "Select a number to generate input fields")) // Placeholder
                :
            SizedBox(
              height: Get.height * 0.33,
              child: Scrollbar (
                thumbVisibility: true,
                radius: Radius.circular(5),

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: fabricCostingController.denierTextControllers.length,

                  itemBuilder: (context, index) {
                    return Form(
                        key: fabricCostingController.formKey[index],
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ColorRes.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),


                              ),
                              child: Column(
                                children: [
                                  Text("FEEDER ${index+1}"),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextFormField(

                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.denierTextControllers[index],
                                          hintText: StringRes.enterDenier,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter denier";
                                            }
                                            return null;
                                          }),
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.pickTextControllers[index],
                                          hintText: StringRes.enterPick,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter pick";
                                            }
                                            return null;
                                          }),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.rateTextControllers[index],
                                          hintText: StringRes.enterYarnRate,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter yarn rate";
                                            }
                                            return null;
                                          }),
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.widthTextControllers[index],
                                          hintText: StringRes.enterFabricWidth,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter fabric width";
                                            }
                                            return null;
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),

    );
}

beam(){
    return SizedBox(
      height: Get.height /2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(

            children: [
              Text("${StringRes.selectNumbersOfBeam} :-", style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w500),),
              SizedBox(width: 10),
              Obx(
                    () => DropdownButton<int>(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(16),
                  focusColor: ColorRes.grey.withOpacity(0.1),
                  underline: SizedBox(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  value: fabricCostingController.dropValueBeam.value == 0
                      ? null
                      : fabricCostingController.dropValueBeam.value,
                  hint: const Text("0"), // Hint text
                  items: List.generate(
                    3,
                        (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  onChanged: (value) {
                    fabricCostingController.dropValueBeam.value = value!;
                    fabricCostingController.updateTextFieldsB(value);
                  },
                ),
              ),
            ],
          ),


          SizedBox(height: 10),
          Obx(
                () =>
            fabricCostingController.dropValueBeam.value == 0
                ? SizedBox()
            // Center(
            //         child: Text(
            //             "Select a number to generate input fields")) // Placeholder
                :
            SizedBox(
              height: Get.height * 0.35,
              child: Scrollbar(
                thumbVisibility: true,
                radius: Radius.circular(5),

                child: ListView.builder(
                  itemCount: fabricCostingController.denierTextControllersB.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Form(
                        key: fabricCostingController.formKeyB[index],
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ColorRes.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),


                              ),
                              child: Column(
                                children: [
                                  Text("BEAM ${index+1}"),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.denierTextControllersB[index],
                                          hintText: StringRes.enterDenier,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter denier";
                                            }
                                            return null;
                                          }),
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.endsTextControllersB[index],
                                          hintText: StringRes.enterEnd,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter ends";
                                            }
                                            return null;
                                          }),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.rateTextControllersB[index],
                                          hintText: StringRes.enterYarnRate,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter yarn rate";
                                            }
                                            return null;
                                          }),
                                      CustomTextFormField(
                                          width: Get.width / 2.5,
                                          controller: fabricCostingController.widthTextControllersB[index],
                                          hintText: StringRes.enterFabricWidth,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.only(top: 8 , bottom: 8, left: 10),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter fabric width";
                                            }
                                            return null;
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),

    );
}

}
