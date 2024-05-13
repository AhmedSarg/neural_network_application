import 'dart:typed_data';

import 'package:app_name/data/network/error_handler.dart';
import 'package:app_name/presentation/base/base_cubit.dart';
import 'package:app_name/presentation/base/base_states.dart';
import 'package:app_name/presentation/resources/assets_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class HomeViewModel extends BaseCubit
    implements HomeViewModelInput, HomeViewModelOutput {
  static HomeViewModel get(context) => BlocProvider.of(context);

  final ImagePicker picker = ImagePicker();

  XFile? _pickedImage;

  Uint8List? _pickedImageBytes;

  String? _result;

  _loadModel() async {
    emit(LoadingState());
    await Tflite.loadModel(
      model: ModelAssets.neuralNetworkModel,
      labels: ModelAssets.neuralNetworkLabels,
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    emit(ContentState());
  }

  Future<void> getImagesFromGallery() async {
    try {
      _pickedImage = await picker.pickImage(source: ImageSource.gallery);
      _pickedImageBytes = await _pickedImage!.readAsBytes();
      _getResult();
    } catch (e) {
      emit(
        ErrorState(
          failure: ErrorHandler.handle(e).failure,
          displayType: DisplayType.popUpDialog,
        ),
      );
    }
  }

  Future<void> _getResult() async {
    emit(LoadingState());
    try {
      List? output = await Tflite.runModelOnImage(
        path: _pickedImage!.path,
        numResults: 1,
      );
      _result = output?[0]['label'];
      emit(ContentState());
    } catch (e) {
      emit(
        ErrorState(
          failure: ErrorHandler.handle(e).failure,
          displayType: DisplayType.popUpDialog,
        ),
      );
    }
  }

  @override
  void start() async {
    await _loadModel();
  }

  @override
  XFile? get getPickedImage => _pickedImage;

  @override
  Uint8List get getPickedImageBytes => _pickedImageBytes!;

  @override
  String? get getResult => _result;
}

abstract class HomeViewModelInput {}

abstract class HomeViewModelOutput {
  XFile? get getPickedImage;

  Uint8List get getPickedImageBytes;

  String? get getResult;
}
