enum LanguageType{
  ENGLISH,
ARABIC
}
const String english = "en";
const String arabic = "ar";


extension LanguageTypeExtension on  LanguageType{
  String getLanguage(){
    switch(this){

      case LanguageType.ENGLISH:
        return english;
      case LanguageType.ARABIC:
        return arabic;

    }
  }
}