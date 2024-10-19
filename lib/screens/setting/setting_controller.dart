import 'package:damacalculator/service/pref_services.dart';
import 'package:damacalculator/utils/pref_key.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{

  RxBool languageDrop = false.obs;

  RxInt index = PrefService.getString(PrefKeys.languageCode) == 'en' ? 0.obs
      : PrefService.getString(PrefKeys.languageCode) == 'hi' ? 1.obs
      : PrefService.getString(PrefKeys.languageCode) == 'gu' ? 2.obs : 0.obs;

}