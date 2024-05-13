import 'package:app_name/app/extensions.dart';
import 'package:app_name/presentation/home_screen/viewmodel/home_viewmodel.dart';
import 'package:app_name/presentation/resources/assets_manager.dart';
import 'package:app_name/presentation/resources/color_manager.dart';
import 'package:app_name/presentation/resources/font_manager.dart';
import 'package:app_name/presentation/resources/language_manager.dart';
import 'package:app_name/presentation/resources/styles_manager.dart';
import 'package:app_name/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  static late HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = HomeViewModel.get(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'Choose an Image to Scan',
            style: getBoldStyle(
              fontFamily: AppLanguages.getPrimaryFont(context),
              color: ColorManager.white,
              fontSize: FontSize.f32,
            ),
          ),
          const Spacer(),
          Container(
            width: (context.width() - AppPadding.p80) * .6,
            height: (context.width() - AppPadding.p80) * .6,
            decoration: BoxDecoration(
              color: ColorManager.transparent,
              borderRadius: BorderRadius.circular(AppSize.s20),
              border: Border.all(
                color: ColorManager.secondary,
                width: AppSize.s4,
                strokeAlign: BorderSide.strokeAlignOutside
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: viewModel.getPickedImage == null
                ? Lottie.asset(LottieAssets.scanning)
                : Image.memory(
                    viewModel.getPickedImageBytes,
                    fit: BoxFit.cover,
                  ),
          ),
          const Spacer(),
          SizedBox(
            height: AppSize.s50,
            child: Text(
              viewModel.getResult ?? '',
              style: getRegularStyle(
                color: ColorManager.white,
                fontSize: FontSize.f32,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: viewModel.getImagesFromGallery,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
              fixedSize: Size(context.width(), AppSize.s50),
              backgroundColor: ColorManager.secondary,
            ),
            child: Text(
              'Choose Image',
              style: getBoldStyle(
                color: ColorManager.black,
                fontFamily: AppLanguages.getPrimaryFont(context),
                fontSize: FontSize.f20,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s30),
        ],
      ),
    );
  }
}
