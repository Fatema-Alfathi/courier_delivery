import 'package:courier_delivery/core/app_export.dart';import 'package:courier_delivery/presentation/onboarding_two_screen/models/onboarding_two_model.dart';/// A controller class for the OnboardingTwoScreen.
///
/// This class manages the state of the OnboardingTwoScreen, including the
/// current onboardingTwoModelObj
class OnboardingTwoController extends GetxController {Rx<OnboardingTwoModel> onboardingTwoModelObj = OnboardingTwoModel().obs;

Rx<int> sliderIndex = 0.obs;

 }
