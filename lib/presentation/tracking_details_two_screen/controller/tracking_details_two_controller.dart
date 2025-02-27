import 'package:courier_delivery/core/app_export.dart';
import 'package:courier_delivery/presentation/tracking_details_two_screen/models/tracking_details_two_model.dart';

/// A controller class for the TrackingDetailsTwoScreen.
///
/// This class manages the state of the TrackingDetailsTwoScreen, including the
/// current trackingDetailsTwoModelObj
class TrackingDetailsTwoController extends GetxController {
  Rx<TrackingDetailsTwoModel> trackingDetailsTwoModelObj =
      TrackingDetailsTwoModel().obs;
}
