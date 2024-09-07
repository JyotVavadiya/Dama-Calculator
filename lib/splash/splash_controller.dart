

import 'package:damacalculator/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    splash();
    super.onInit();
  }
  
  splash() async{
    await Future.delayed(Duration(seconds: 7), (){
      Get.to(DashboardScreen());
    });
  }
  
}