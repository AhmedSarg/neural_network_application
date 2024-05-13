import 'package:app_name/presentation/base/base_states.dart';
import 'package:app_name/presentation/base/cubit_builder.dart';
import 'package:app_name/presentation/base/cubit_listener.dart';
import 'package:app_name/presentation/home_screen/view/home_body.dart';
import 'package:app_name/presentation/home_screen/viewmodel/home_viewmodel.dart';
import 'package:app_name/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppSize.infinity,
        width: AppSize.infinity,
        child: BlocProvider(
          create: (context) => HomeViewModel()..start(),
          child: BlocConsumer<HomeViewModel, BaseStates>(
            listener: (context, state) {
              baseListener(context, state);
            },
            builder: (context, state) {
              return baseBuilder(context, state, HomeBody());
            },
          ),
        ),
      ),
    );
  }
}
