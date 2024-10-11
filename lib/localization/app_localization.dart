import 'package:get/get.dart';
import 'en_us_translations.dart';
import 'gu_IN_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs, 'gu_IN': guIN};
}
