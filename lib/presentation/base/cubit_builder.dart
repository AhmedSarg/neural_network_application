import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseStates state, Widget content) {
  if (state.displayType == DisplayType.popUpDialog) return content;

  if (state is InitState) {
    //do nothing
    return content;
  } else if (state is SuccessState) {
    //do nothing
    return content;
  } else if (state is LoadingState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.loading),
    ]);
  } else if (state is ErrorState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.error),
      BaseWidgets.buildMessage(context, state.failure.message),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain.tr()),
    ]);
  } else if (state is ContentState) {
    //do nothing
    return content;
  } else if (state is EmptyState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.empty),
      BaseWidgets.buildMessage(context, AppStrings.emptyContent.tr()),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain.tr()),
    ]);
  } else if (state is IntentEmptyState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.empty),
      BaseWidgets.buildMessage(context, AppStrings.intentError.tr()),
    ]);
  } else {
    return content;
  }
}
