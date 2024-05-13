import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../resources/text_styles.dart';
import '../resources/values_manager.dart';
import 'base_states.dart';

class BaseWidgets {
  BaseWidgets._();

  static Widget buildImage(String imgPath) {
    return SizedBox(
        height: AppSize.s100, width: AppSize.s100, child: Image.asset(imgPath));
  }

  static Widget buildAnimatedImage(String lottiePath) {
    return SizedBox(
        height: AppSize.s200,
        width: AppSize.s200,
        child: Lottie.asset(lottiePath));
  }

  static Widget buildItemsColumn(List<Widget> children) {
    return SizedBox(
      width: AppSize.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  ///not used yet
  // static Widget buildItemsRow(List<Widget> children) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisSize: MainAxisSize.min,
  //     children: children,
  //   );
  // }

  static void showPopUpDialog(BuildContext context, List<Widget> children,
      {List<Widget>? actions}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: actions,
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              content: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                ),
              ),
            ));
  }

  static Widget buildMessage(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: AppTextStyles.baseStatesMessageTextStyle(context),
        ),
      ),
    );
  }

  static Widget buildButton(
      {required DisplayType displayType,
      required BuildContext context,
      required String title,
      void Function()? onTap}) {
    if (onTap == null) return const SizedBox();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  if (displayType == DisplayType.popUpDialog) {
                    Navigator.of(context).pop();
                  }
                  onTap();
                },
                child: Text(
                  title,
                  style: AppTextStyles.baseStatesElevatedBtnTextStyle(context),
                ))),
      ),
    );
  }
}
