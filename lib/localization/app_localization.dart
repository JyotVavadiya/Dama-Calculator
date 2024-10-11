import 'hi_in_translation.dart';
import 'package:get/get.dart';
import 'en_us_translations.dart';
import 'gu_in_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'gu_IN': guIN,
    'hi_IN': hiIN,
  };
}
