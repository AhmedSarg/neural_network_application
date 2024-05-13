class ImageAssets {
  ImageAssets._();
  static const String _imagePath = "assets/images/";
}

class IconsAssets {
  IconsAssets._();
  static const String _basePath = "assets/icons/";
}

class SVGAssets {
  SVGAssets._();
  static const String _basePath = "assets/svg/";
}

class LottieAssets {
  LottieAssets._();
  static const String _basePath = "assets/lotties/";

  static const String loading = "${_basePath}loading.json";
  static const String success = "${_basePath}success.json";
  static const String empty = "${_basePath}empty.json";
  static const String error = "${_basePath}error.json";
  static const String areYouSure = "${_basePath}are_you_sure.json";
  static const String scanning = "${_basePath}scanning.json";
}

class ModelAssets {
  ModelAssets._();
  static const String _basePath = "assets/model/";

  static const String neuralNetworkModel = "${_basePath}model.tflite";
  static const String neuralNetworkOldModel = "${_basePath}old_model.tflite";
  static const String neuralNetworkLabels = "${_basePath}labels.txt";
}
