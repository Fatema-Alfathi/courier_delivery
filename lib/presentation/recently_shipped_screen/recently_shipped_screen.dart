import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:courier_delivery/core/app_export.dart';
import 'package:courier_delivery/widgets/app_bar/appbar_image.dart';
import 'package:courier_delivery/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:courier_delivery/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/recently_shipped_data_model.dart';

class RecentlyShippedScreen extends StatefulWidget {
  const RecentlyShippedScreen({Key? key}) : super(key: key);

  @override
  State<RecentlyShippedScreen> createState() => _RecentlyShippedScreenState();
}

class _RecentlyShippedScreenState extends State<RecentlyShippedScreen> {
  HomeContainerController controller = Get.put(HomeContainerController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    //  WillPopScope(
    //     onWillPop: () async {
    //       Get.back();
    //       return true;
    //     },
    //     child:
         ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar(
                  height: getVerticalSize(79),
                  leadingWidth: 42,
                  leading: AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgArrowleft,
                      margin: getMargin(left: 18, top: 29, bottom: 26),
                      onTap: () {
                        onTapArrowleft15();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "lbl_recent_shipped".tr),
                  styleType: Style.bgFillWhiteA700),
              body: ListView.builder(
                padding: getPadding(left: 16, right: 16),
                itemCount: controller.recentlyShipped.length,
                itemBuilder: (context, index) {
                  RecentlyShipped data = controller.recentlyShipped[index];
                  return Padding(
                    padding: getPadding(top: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.gray50,
                          borderRadius:
                              BorderRadius.circular(getHorizontalSize(8))),
                      child: Padding(
                        padding: getPadding(
                            top: 16, left: 16, right: 16, bottom: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomIconButton(
                                      height: 42,
                                      width: 42,
                                      shape: IconButtonShape.CircleBorder20,
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowdownDeepPurple600)),
                                  SizedBox(
                                    width: getHorizontalSize(8),
                                  ),
                                  Container(
                                      margin: getMargin(left: 8, top: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("lbl_shipped_to".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                               style: Theme.of(context).textTheme.titleMedium!,
                                               selectionColor: Colors.grey
                                             
                                                    ),
                                            Padding(
                                                padding: getPadding(top: 4),
                                                child: Text(data.name!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                   style: Theme.of(context).textTheme.titleMedium!,
                                                        ))
                                          ]))
                                ]),
                            SizedBox(
                              height: getVerticalSize(15),
                            ),
                            Text("Order id : ${data.orderID}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFProTextRegular14),
                            Padding(
                                padding: getPadding(top: 16),
                                child: Text("Order date : ${data.date}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtFootnote)),
                            SizedBox(
                              height: getVerticalSize(15),
                            ),
                            CustomButton(
                              onTap: () {
                                Get.toNamed(AppRoutes.trackingDetailsScreen);
                              },
                              height: getSize(40),
                              text: "lbl_track_package".tr,
                              fontStyle:
                                  ButtonFontStyle.SFProTextBold15WhiteA700,
                              padding: ButtonPadding.PaddingT0,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ));
            // );
  }

  onTapTrackpackage() {
    Get.toNamed(AppRoutes.trackingDetailsTwoScreen);
  }

  onTapArrowleft15() {
    Get.back();
  }
}
