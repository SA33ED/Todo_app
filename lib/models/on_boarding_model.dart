import 'package:to_do_app/helpers/app_strings.dart';

import '../helpers/app_assets.dart';

class OnBoardingModel {
  String image;
  String title;
  String subTitle;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      image: Assets.imagesOnBoardingOne,
      title: AppStrings.onBoardingTitleOne,
      subTitle: AppStrings.onBoardingSubTitleOne),
  OnBoardingModel(
      image: Assets.imagesOnBoardingTwo,
      title: AppStrings.onBoardingTitleTwo,
      subTitle: AppStrings.onBoardingSubTitleTwo),
  OnBoardingModel(
      image: Assets.imagesOnBoardingThree,
      title: AppStrings.onBoardingTitleThree,
      subTitle: AppStrings.onBoardingSubTitleThree),
];
