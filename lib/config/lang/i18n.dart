// @Langs
import 'package:workshop_twitter/config/lang/en.dart';

const String KEY_NOT_FOUND = '####';
const String REPLACEMENT_WILDCARD = '\%\s';

String injectTexts(String translatedText, List<String> injectedTexts) {
  if(injectedTexts == null) {
    return translatedText;
  }
  injectedTexts.forEach((text) {
    translatedText = translatedText.replaceFirst(REPLACEMENT_WILDCARD, text);
  });
  return translatedText;
}

String getTranslation(String screen, String key, {List<String> injectedTexts}) {
  if(translations[screen] == null) {
    return KEY_NOT_FOUND;
  }
  if(translations[screen][key] == null) {
    return KEY_NOT_FOUND;
  }
  String translatedText = translations[screen][key];
  return injectTexts(translatedText, injectedTexts);
}