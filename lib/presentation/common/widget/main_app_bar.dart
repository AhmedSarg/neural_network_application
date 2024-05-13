import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

AppBar buildMainAppBar(BuildContext context, Color? color, [double elevation = 4]) {
  color ??= ColorManager.primary;
  return AppBar(
    backgroundColor: color,
    elevation: elevation,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
  );
}