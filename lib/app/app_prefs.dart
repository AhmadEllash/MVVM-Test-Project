
import 'package:advanced_flutter/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String pressKeyLanguage = 'press key language';

class AppPreferences{
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage() async{
     String? language = _sharedPreferences.getString(pressKeyLanguage);
    if(language != null && language.isNotEmpty){
      return language;
    }else{
      return LanguageType.ARABIC.getLanguage();
     }
  }
}