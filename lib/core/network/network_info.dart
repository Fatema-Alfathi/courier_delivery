import 'package:courier_delivery/core/app_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:async';



// // For checking internet connectivity
// abstract class NetworkInfoI {
//   Future<bool> isConnected();

//   Future<ConnectivityResult> get connectivityResult;

//   Stream<ConnectivityResult> get onConnectivityChanged;
// }

// class NetworkInfo implements NetworkInfoI {
//   Connectivity connectivity;

//   NetworkInfo(this.connectivity) {
//     connectivity = this.connectivity;
//   }

//   ///checks internet is connected or not
//   ///returns [true] if internet is connected
//   ///else it will return [false]
//   @override
//   Future<bool> isConnected() async {
//       final result = await connectivity.checkConnectivity();
//       if (result != ConnectivityResult.none) {
//         return true;
//       }
//     return false;
//   }

//   // to check type of internet connectivity
//   @override
//   Future<ConnectivityResult> get connectivityResult async {
//     return connectivity.checkConnectivity();
//   }

//   //check the type on internet connection on changed of internet connection
//   @override
//   Stream<ConnectivityResult> get onConnectivityChanged =>
//       connectivity.onConnectivityChanged;
// }

class ConnectivityController extends GetxController {
  final _connectionType = MConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  MConnectivityResult get connectionType => _connectionType.value;

  set connectionType(value) {
    _connectionType.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState as void Function(List<ConnectivityResult> event)?);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = (await (_connectivity.checkConnectivity())) as ConnectivityResult;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = MConnectivityResult.wifi;
        break;
      case ConnectivityResult.mobile:
        connectionType = MConnectivityResult.mobile;
        break;
      case ConnectivityResult.none:
        connectionType = MConnectivityResult.none;
        break;
      default:
        print('Failed to get connection type');
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}

enum MConnectivityResult { none, wifi, mobile }
