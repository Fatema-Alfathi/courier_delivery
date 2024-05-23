import 'package:courier_delivery/core/app_export.dart';import 'package:courier_delivery/presentation/cancel_order_screen/models/cancel_order_model.dart';/// A controller class for the CancelOrderScreen.
///
/// This class manages the state of the CancelOrderScreen, including the
/// current cancelOrderModelObj
class CancelOrderController extends GetxController {Rx<CancelOrderModel> cancelOrderModelObj = CancelOrderModel().obs;

 }
