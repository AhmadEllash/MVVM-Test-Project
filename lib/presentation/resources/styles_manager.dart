
import 'package:advanced_flutter/presentation/resources/fonts_manager.dart';
import 'package:flutter/material.dart';


  TextStyle _getTextStyle (double fontSize , FontWeight fontWeight , Color color){
    return  TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }
  regularTextStyle({double fontSize = FontSizeManager.s12,required Color color}){
    return _getTextStyle(fontSize, FontWeightManager.w3, color);
  }
  mediumTextStyle({double fontSize = FontSizeManager.s12,required Color color}){
    return _getTextStyle(fontSize, FontWeightManager.w4, color);
  }
  lightTextStyle({double fontSize = FontSizeManager.s12,required Color color}){
    return _getTextStyle(fontSize, FontWeightManager.w5, color);
  }
  boldTextStyle({double fontSize = FontSizeManager.s12,required Color color}){
    return _getTextStyle(fontSize, FontWeightManager.w6, color);
  }
