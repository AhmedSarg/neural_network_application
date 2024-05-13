import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'language_manager.dart';
import 'styles_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  ///Base

  static TextStyle baseStatesMessageTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.secondary,
        fontSize: FontSize.f16,
      );

  static TextStyle baseStatesElevatedBtnTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.white,
        fontSize: FontSize.f14,
      );

}