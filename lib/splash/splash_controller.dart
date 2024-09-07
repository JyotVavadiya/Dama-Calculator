

import 'package:damacalculator/dashboard/dashboard_screen.dart';
import 'package:damacalculator/login/login_screen.dart';
import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    splash();
    super.onInit();
  }
  
  splash() async{
    await Future.delayed(Duration(seconds: 6), (){
      if(PrefService.getBool(PrefKeys.isLogin)){
        Get.to(DashboardScreen());
      } else{
        Get.to(LoginScreen());
      }

    });
  }
  
}