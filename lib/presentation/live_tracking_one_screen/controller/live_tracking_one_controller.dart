import 'package:courier_delivery/core/app_export.dart';import 'package:courier_delivery/presentation/live_tracking_one_screen/models/live_tracking_one_model.dart';/// A controller class for the LiveTrackingOneScreen.
///
/// This class manages the state of the LiveTrackingOneScreen, including the
/// current liveTrackingOneModelObj
class LiveTrackingOneController extends GetxController {Rx<LiveTrackingOneModel> liveTrackingOneModelObj = LiveTrackingOneModel().obs;

 }
