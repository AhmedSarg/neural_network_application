import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import 'base_states.dart';
import 'base_widgets.dart';

void baseListener(BuildContext context, BaseStates state) {
  if (state.displayType == DisplayType.fullScreen) return;

  if (state is InitState) {
    //do nothing
  } else if (state is SuccessState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.success),
      BaseWidgets.buildMessage(context, state.message),
    ]);
  } else if (state is LoadingState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.loading),
    ]);
  } else if (state is ErrorState) {
    BaseWidgets.showPopUpDialog(context, [
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
  } else if (state is IntentEmptyState) {
    //do nothing
  } else if (state is EmptyState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.error),
      BaseWidgets.buildMessage(context, AppStrings.emptyContent.tr()),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain.tr()),
    ]);
  } else if (state is ConfirmState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.areYouSure),
      BaseWidgets.buildMessage(context, AppStrings.areYouSure.tr()),
    ], actions: [
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.onAccept,
          title: AppStrings.sure.tr()),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.onCancel,
          title: AppStrings.cancel.tr()),
    ]);
  }
}
