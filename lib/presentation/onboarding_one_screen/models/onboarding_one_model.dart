import 'package:courier_delivery/core/app_export.dart';

import 'slidertrackyour_item_model.dart';

/// This class defines the variables used in the [onboarding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  // Rx<List<SlidertrackyourItemModel>> slidertrackyourItemList =
  //     Rx(List.generate(1, (index) => SlidertrackyourItemModel()));

  static List<SlidertrackyourItemModel> slidertrackyourItemList() {
    return [
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding1st,
          "Track your parcel from anywhere",
          "A courier is a company, an employee of that company or a person who delivers a message"),
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding2nd,
          "Best package delivery just for you",
          "A courier is a company, an employee of that company or a person who delivers a message"),
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding3rd,
          "Bring Happiness with fastest delivery",
          "A courier is a company, an employee of that company or a person who delivers a message"),
    ];
  }
}
