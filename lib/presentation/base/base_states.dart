import '../../data/network/failure.dart';

enum DisplayType { fullScreen, popUpDialog }

abstract class BaseStates {
  final DisplayType displayType;

  BaseStates({this.displayType = DisplayType.fullScreen});
}

class InitState extends BaseStates {}

class LoadingState extends BaseStates {
  LoadingState({super.displayType});
}

class ErrorState extends BaseStates {
  final Failure failure;
  final void Function()? retry;

  ErrorState({super.displayType, this.retry, required this.failure});
}

class ContentState extends BaseStates {}

class EmptyState extends BaseStates {
  EmptyState({super.displayType, this.retry});

  final void Function()? retry;
}

class IntentEmptyState extends BaseStates {
  IntentEmptyState();

}

class ConfirmState extends BaseStates {
  final void Function() onAccept;
  final void Function() onCancel;

  ConfirmState({
    required this.onAccept,
    required this.onCancel,
  }) : super(displayType: DisplayType.popUpDialog);
}

class SuccessState extends BaseStates {
  SuccessState(this.message) : super(displayType: DisplayType.popUpDialog);
  final String message;
}
