import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FabricCostingController extends GetxController {

  /// ------------ tab -----------
  var selectedIndex = 0.obs; // Observable tab index

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  /// ------------ feeder ---------

  var dropValueFeeder = 0.obs;

  var denierTextControllers = <TextEditingController>[].obs;
  var pickTextControllers = <TextEditingController>[].obs;
  var rateTextControllers = <TextEditingController>[].obs;
  var widthTextControllers = <TextEditingController>[].obs;

  final formKey = <GlobalKey<FormState>>[].obs;

  // Function to update the number of TextFields based on selected value
  void updateTextFields(int count) {

    formKey.value = List.generate(
      count,
          (index) => GlobalKey<FormState>(),
    );

    denierTextControllers.value = List.generate(
      count,
          (index) => TextEditingController(),
    );

    pickTextControllers.value = List.generate(
      count,
          (index) => TextEditingController(),
    );
    rateTextControllers.value = List.generate(
      count,
          (index) => TextEditingController(),
    );
    widthTextControllers.value = List.generate(
      count,
          (index) => TextEditingController(),
    );
  }

  /// ------------ beam ---------

  var dropValueBeam = 0.obs;

  var denierTextControllersB = <TextEditingController>[].obs;
  var endsTextControllersB = <TextEditingController>[].obs;
  var rateTextControllersB = <TextEditingController>[].obs;
  var widthTextControllersB = <TextEditingController>[].obs;

  final formKeyB = <GlobalKey<FormState>>[].obs;

  // Function to update the number of TextFields based on selected value
  void updateTextFieldsB(int count) {

    formKeyB.value = List.generate(
      count,
          (index) => GlobalKey<FormState>(),
    );

    denierTextControllersB.value = List.generate(
      count,
          (index) => TextEditingController(),
    );

    endsTextControllersB.value = List.generate(
      count,
          (index) => TextEditingController(),
    );
    rateTextControllersB.value = List.generate(
      count,
          (index) => TextEditingController(),
    );
    widthTextControllersB.value = List.generate(
      count,
          (index) => TextEditingController(),
    );
  }






}