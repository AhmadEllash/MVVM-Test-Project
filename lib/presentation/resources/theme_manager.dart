
import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:advanced_flutter/presentation/resources/fonts_manager.dart';
import 'package:advanced_flutter/presentation/resources/styles_manager.dart';
import 'package:advanced_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primaryLight,
    disabledColor: ColorsManager.secondaryFontColor,
    splashColor: ColorsManager.primary,

    cardTheme: const CardTheme(
      color: Colors.white10,
      elevation: AppSize.s4,
      shadowColor: ColorsManager.secondaryFontColor,
    ),
    appBarTheme: AppBarTheme(
     centerTitle: true,
     color: ColorsManager.primary,
     shadowColor: ColorsManager.secondaryFontColor,
     elevation: AppSize.s4,
     titleTextStyle: regularTextStyle(color: ColorsManager.secondaryFontColor,fontSize: FontSizeManager.s16),
    ),
    buttonTheme:  ButtonThemeData(
      buttonColor: ColorsManager.primary,
      disabledColor: ColorsManager.secondaryFontColor,
      shape: const StadiumBorder(),
      splashColor: ColorsManager.primary.withOpacity(.5),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorsManager.primary,
        textStyle: regularTextStyle(color: ColorsManager.secondaryFontColor,fontSize:FontSizeManager.s12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    textTheme: TextTheme(
      displayLarge:boldTextStyle(color: ColorsManager.primaryFontColor,fontSize: FontSizeManager.s10) ,
      headlineMedium: regularTextStyle(color: ColorsManager.primaryFontColor),
      titleSmall: regularTextStyle(color: ColorsManager.secondaryFontColor),
      bodySmall: regularTextStyle(color: ColorsManager.secondaryFontColor),

    ),

    inputDecorationTheme:  InputDecorationTheme(
      contentPadding:  const EdgeInsets.all(AppSize.s8),
      hintStyle: regularTextStyle(color: ColorsManager.secondaryFontColor),
      labelStyle: regularTextStyle(color: ColorsManager.primaryFontColor),
      enabledBorder: OutlineInputBorder(
        borderSide:  const BorderSide(color: ColorsManager.secondaryFontColor,width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.activeColor,width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.error,width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.activeColor,width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),

    ),

  );
}