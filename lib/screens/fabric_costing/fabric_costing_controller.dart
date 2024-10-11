import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class FabricCostingController extends GetxController {

  RxDouble totalCost = 0.0.obs;
  RxDouble totalFeeder = 0.0.obs;
  RxDouble totalBeam = 0.0.obs;


  /// ------------ tab -----------
  var selectedIndex = 0.obs; // Observable tab index

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  /// ------------ feeder ---------


  RxList fYarn = [].obs;
  RxList f100m = [].obs;
  RxList f1m = [].obs;

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


    fYarn.value = List.generate(
      count,
          (index) => 0.0,
    );
    f100m.value = List.generate(
      count,
          (index) => 0.0,
    );
    f1m.value = List.generate(
      count,
          (index) => 0.0,
    );


  }

  onEditComplete(int index ){



      if(denierTextControllers[index].text.isNotEmpty &&
          pickTextControllers[index].text.isNotEmpty &&
          rateTextControllers[index].text.isNotEmpty &&
          widthTextControllers[index].text.isNotEmpty
      ){
        fYarn[index] = (double.parse(denierTextControllers[index].text) * double.parse(pickTextControllers[index].text) * double.parse(widthTextControllers[index].text))/90000;
        f100m[index] = fYarn[index] *  double.parse(rateTextControllers[index].text);
        f1m[index] = f100m[index]/100;


        totalFeeder.value = f1m.fold(0.0, (previousValue, element) => previousValue + element) ;
        totalCost.value = totalBeam.value + totalFeeder.value;



      } else{

      }

  }


  /// ------------ beam ---------

  var dropValueBeam = 0.obs;

  var denierTextControllersB = <TextEditingController>[].obs;
  var endsTextControllersB = <TextEditingController>[].obs;
  var rateTextControllersB = <TextEditingController>[].obs;
  var widthTextControllersB = <TextEditingController>[].obs;

  final formKeyB = <GlobalKey<FormState>>[].obs;

  RxList bYarn = [].obs;
  RxList b100m = [].obs;
  RxList b1m = [].obs;

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

    bYarn.value = List.generate(
      count,
          (index) => 0.0,
    );
    b100m.value = List.generate(
      count,
          (index) => 0.0,
    );
    b1m.value = List.generate(
      count,
          (index) => 0.0,
    );

  }


  onChange(int index ){



    if(denierTextControllersB[index].text.isNotEmpty &&
        endsTextControllersB[index].text.isNotEmpty &&
        rateTextControllersB[index].text.isNotEmpty &&
        widthTextControllersB[index].text.isNotEmpty
    ){
      bYarn[index] = (double.parse(denierTextControllersB[index].text) * double.parse(endsTextControllersB[index].text) * double.parse(widthTextControllersB[index].text))/90000;
      b100m[index] = bYarn[index] *  double.parse(rateTextControllersB[index].text)/3;
      b1m[index] = b100m[index]/100;

      totalBeam.value = b1m.fold(0.0, (previousValue, element) => previousValue + element) ;

      totalCost.value = totalBeam.value + totalFeeder.value ;


    } else{

    }

  }






}