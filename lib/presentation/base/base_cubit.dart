import 'package:bloc/bloc.dart';

import 'base_states.dart';

abstract class BaseCubit extends Cubit<BaseStates> {
  BaseCubit() : super(InitState());

  void start();
}
