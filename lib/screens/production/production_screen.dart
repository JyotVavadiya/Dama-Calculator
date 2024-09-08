import 'package:damacalculator/commons/custom_elevated_button.dart';
import 'package:damacalculator/commons/custom_text_form_field.dart';
import 'package:damacalculator/screens/production/production_controller.dart';
import 'package:damacalculator/utils/string_res.dart';
import 'package:flutter/material.dart';
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
              CustomTextFormField(
                  controller: controller.reedController,
                  hintText: StringRes.reed,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter reed";
                    }
                    return null;
                  }),
              SizedBox(height: 20),
              CustomTextFormField(
                  controller: controller.pickController,
                  hintText: StringRes.pick,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter pick";
                    }
                    return null;
                  }),
              SizedBox(height: 20),
              CustomTextFormField(
                  controller: controller.timeController,
                  hintText: StringRes.time,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter time";
                    }
                    return null;
                  }),
              SizedBox(height: 20),
              CustomTextFormField(
                  controller: controller.efficiencyController,
                  hintText: StringRes.efficiency,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter efficiency";
                    }
                    return null;
                  }),
              SizedBox(height: 40),
              CustomElevatedButton(
                text: StringRes.calculate,
                onPressed: (){
                  if (_formKey.currentState!.validate()) {

                  } else{

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
