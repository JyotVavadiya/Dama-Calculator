import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DashboardController extends GetxController {

  RxBool loader = false.obs;
  RxInt index = 0.obs;
  RxString userName = "User name".obs;
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLogin.value = PrefService.getBool(PrefKeys.isLogin);

  }




}