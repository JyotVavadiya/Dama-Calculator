import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:get/get.dart';

class LabourWorkController extends GetxController{

  RxBool isLogin = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLogin.value = PrefService.getBool(PrefKeys.isLogin);
  }

}