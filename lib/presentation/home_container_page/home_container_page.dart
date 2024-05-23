import 'package:courier_delivery/presentation/home_container_page/models/home_slider_model.dart';
import 'package:courier_delivery/widgets/custom_button.dart';
import '../home_container_page/widgets/slidermaskgroup_item_widget.dart';
import 'controller/home_container_controller.dart';
import 'models/corier_service_model.dart';
import 'models/recently_shipped_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:courier_delivery/core/app_export.dart';
import 'package:courier_delivery/widgets/app_bar/appbar_image.dart';
import 'package:courier_delivery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeContainerPage extends StatelessWidget {
  HomeContainerPage({Key? key}) : super(key: key);

  HomeContainerController controller =
      Get.put(HomeContainerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.white,
      child: Column(
        children: [
          Padding(
            padding:getPadding(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppbarImage(
                        height: getSize(20),
                        width: getSize(20),
                        svgPath: ImageConstant.imgSignal,
                        margin: getMargin(left: 16, top: 18, bottom: 18)),
                    SizedBox(
                      width: getHorizontalSize(12),
                    ),
                    Text(
                      "lbl_new_york".tr,
                      style: AppStyle.txtSFProTextBold28,
                    ),
                  ],
                ),
                Padding(
                  padding:getPadding(right: 16),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.chatBotScreen);
                    },
                    child: Container(
                      height: getSize(48),
                      width: getSize(48),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getHorizontalSize(8)),
                        color: ColorConstant.deepPurple600
                      ),
                      child: Padding(
                        padding: getPadding(all: 11),
                        child: CustomImageView(
                          height: getSize(26),
                          width: getSize(26),
                          svgPath: ImageConstant.imgmessegeIcon,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getVerticalSize(10),
          ),
          Expanded(
              child: ListView(
            children: [
              CarouselSlider.builder(
                  options: CarouselOptions(
                      height: getVerticalSize(140),
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 0.8,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        controller.sliderIndex.value = index;
                      }),
                  itemCount: controller.sliderData.length,
                  itemBuilder: (context, index, realIndex) {
                    HomeSlider model = controller.sliderData[index];
                    return SlidermaskgroupItemWidget(model);
                  }),
              Obx(
                () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(controller.sliderData.length, (index) {
                      return AnimatedContainer(
                        margin:
                            getMargin(left: 4, top: 16, bottom: 16, right: 4),
                        duration: const Duration(milliseconds: 300),
                        height: getVerticalSize(6),
                        width: getHorizontalSize(
                            index == controller.sliderIndex.value ? 16 : 6),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(getHorizontalSize(12)),
                            color: (index == controller.sliderIndex.value)
                                ? ColorConstant.black900
                                : ColorConstant.black900.withOpacity(0.10)),
                      );
                    })),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(left: 16, top: 21),
                      child: Text("lbl_categories".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFProTextBold20))),
              SizedBox(
                height: getVerticalSize(16),
              ),
              Padding(
                padding: getPadding(left: 16, right: 16),
                child: Row(
                  children: [
                    category_button(() {
                      Get.toNamed(AppRoutes.sendPackageScreen);
                    }, "lbl_send_package".tr,
                        ImageConstant.imgSendPackegeIcon),
                    SizedBox(
                      width: getHorizontalSize(8),
                    ),
                    category_button(() {
                      Get.toNamed(AppRoutes.calculatePriceOneScreen);
                    }, "lbl_shipment_price".tr,
                        ImageConstant.imgShipmentPriceIcon),
                    SizedBox(
                      width: getHorizontalSize(8),
                    ),
                    category_button(() {
                      Get.toNamed(AppRoutes.orderTrackingScreen);
                    }, "lbl_order_tracking".tr,
                        ImageConstant.imgOrderTracingIcon),
                  ],
                ),
              ),
              SizedBox(
                width: getHorizontalSize(16),
              ),
              Padding(
                  padding: getPadding(left: 16, top: 19, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("msg_courier_services".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProTextBold20),
                        GestureDetector(
                            onTap: () {
                              onTapTxtViewall();
                            },
                            child: Padding(
                                padding: getPadding(top: 3, bottom: 3),
                                child: Text("lbl_view_all".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFProTextRegular14)))
                      ])),
              SizedBox(
                height: getVerticalSize(16),
              ),
              SizedBox(
                height: getSize(109),
                child: ListView.builder(
                  padding: getPadding(left: 8, right: 8),
                  itemCount: controller.courierData.length < 2
                      ? controller.courierData.length
                      : 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CourierService data = controller.courierData[index];
                    return Padding(
                      padding: getPadding(left: 8, right: 8),
                      child: Container(
                        width: getSize(236),
                        decoration: BoxDecoration(
                            color: ColorConstant.gray50,
                            borderRadius:
                                BorderRadius.circular(getHorizontalSize(8))),
                        child: Padding(
                          padding: getPadding(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    svgPath: data.icon,
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant.imgStar,
                                        height: getSize(14),
                                        width: getSize(14),
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 4, top: 2, bottom: 1),
                                          child: Text("lbl_5_0".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtFootnote))
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              Container(
                                child: Text(
                                  data.subtitle!,
                                  style: AppStyle.txtAvenirRegular13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: getVerticalSize(16),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgSubBanner,
              ),
              SizedBox(
                height: getVerticalSize(16),
              ),
              Padding(
                padding: getPadding(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("msg_recently_shipped".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFProTextBold20),
                    GestureDetector(
                        onTap: () {
                          onTapTxtViewallone();
                        },
                        child: Padding(
                            padding: getPadding(top: 1, bottom: 5),
                            child: Text("lbl_view_all".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFProTextRegular14)))
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(16),),
              SizedBox(
                height: getSize(194),
                child: ListView.builder(
                  padding: getPadding(left: 8,right: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.recentlyShipped.length < 2
                      ? controller.recentlyShipped.length
                      : 2,
                  itemBuilder: (context, index) {
                    RecentlyShipped data = controller.recentlyShipped[index];
                    return Padding(
                      padding: getPadding(left: 8, right: 8),
                      child: Container(
                        width: getSize(300),
                        decoration: BoxDecoration(
                            color: ColorConstant.gray50,
                            borderRadius:
                                BorderRadius.circular(getHorizontalSize(8))),
                        child: Padding(
                          padding: getPadding(top: 13,left:13,right: 13),
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
                                      
                                        height:42,
                                        width: 42,
                                        shape: IconButtonShape.CircleBorder20,
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownDeepPurple600)),
                                    SizedBox(
                                      width: getHorizontalSize(5),
                                    ),
                                    Container(
                                        margin: getMargin(left: 8, top: 3),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_shipped_to".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.titleMedium!,
                                                     selectionColor: Colors.grey),
                                              Padding(
                                                  padding: getPadding(top: 3),
                                                  child: Text(data.name!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                     style: Theme.of(context).textTheme.titleLarge,
                                                          ))
                                            ]))
                                  ]),
                              SizedBox(height: getVerticalSize(7),),
                              Text("Order id : ${data.orderID}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProTextRegular14),
                              Text("Order date : ${data.date}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtFootnote),
                              SizedBox(height: getVerticalSize(13),),
                              CustomButton(
                                  onTap: (){
                                    Get.toNamed(AppRoutes.trackingDetailsScreen);

                                },
                                height: getSize(10),
                                text: "lbl_track_package".tr,
                                fontStyle: ButtonFontStyle.SFProTextBold15WhiteA700,
                                padding: ButtonPadding.PaddingT0,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: getVerticalSize(15),),
            ],
          ))
        ],
      ),
    );

  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.courierServicesScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.recentlyShippedScreen,
    );
  }

  Widget category_button(function, text, icon) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getHorizontalSize(8)),
              color: ColorConstant.gray50),
          height: getSize(40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: icon,
                height: getSize(24),
                width: getSize(24),
              ),
              SizedBox(
                width: getHorizontalSize(8),
              ),
              Text(text,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProTextMedium14)
            ],
          ),
        ),
      ),
    );
  }
}
