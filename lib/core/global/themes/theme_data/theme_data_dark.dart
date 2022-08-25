import 'package:flutter/material.dart';
import 'package:movies_and_tv_app/core/global/themes/app_color/app_color_dark.dart';

ThemeData getThemeDataDark()=>ThemeData(
  scaffoldBackgroundColor:  AppColorDark.backgroungColor,
  textTheme: TextTheme(
    bodyText2:  TextStyle(color: Colors.white),

  ),
);