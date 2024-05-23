import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaQueryService extends GetxService {
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var orientation = Orientation.portrait.obs;

  void updateMediaQuery(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenWidth.value = size.width;
    screenHeight.value = size.height;
    orientation.value = MediaQuery.of(context).orientation;
  }
}
