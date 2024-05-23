import 'package:courier_delivery/core/app_export.dart';
import 'package:courier_delivery/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../controller/home_container_controller.dart';
import '../models/home_slider_model.dart';

// ignore: must_be_immutable
class SlidermaskgroupItemWidget extends StatelessWidget {
  SlidermaskgroupItemWidget(
    this.slidermaskgroupItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomeSlider slidermaskgroupItemModelObj;

  var controller = Get.find<HomeContainerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(333),
      height: getSize(150),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(slidermaskgroupItemModelObj.image!),
              fit: BoxFit.fill)),
      child: Padding(
        padding: getPadding(left: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getSize(174),
              child: Text(
                slidermaskgroupItemModelObj.title!,
                maxLines: null,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,
                selectionColor: Colors.white70,
               
              ),
            ),
            SizedBox(
              height: getVerticalSize(8),
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.selectCourierServiceScreen);
              },
              height: getVerticalSize(
                34,
              ),
              width: getHorizontalSize(
                103,
              ),
              text: "lbl_book_now".tr,
              variant: ButtonVariant.White,
              padding: ButtonPadding.PaddingAll8,
              fontStyle: ButtonFontStyle.SFProTextBold15,
            ),
          ],
        ),
      ),
    );
  }
}
