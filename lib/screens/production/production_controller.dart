import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProductionController extends GetxController{

  TextEditingController motorRPMController = TextEditingController();
  TextEditingController pdController = TextEditingController();
  TextEditingController lpdController = TextEditingController();
  Rx<TextEditingController> rpmController = TextEditingController().obs;
  TextEditingController pickController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();

  RxDouble rpm = 0.0.obs ;
  RxDouble production = 0.0.obs;

}