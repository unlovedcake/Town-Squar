import 'package:get/get.dart';

part '../localization/english_translation_map.dart';
part 'espanol_translation_map.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _englishTranslationMap,
        'es_VE': _espanolTranslationMap,
      };
}
