import 'package:courier_delivery/core/app_export.dart';

// class InitialBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(PrefUtils());
//     Get.put(ApiClient());
//     Connectivity connectivity = Connectivity();
//     Get.put(NetworkInfo(connectivity));
//   }
// }
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());

  }
}

