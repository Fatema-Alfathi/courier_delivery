import 'package:courier_delivery/presentation/notifications_page/notifications_page.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custum_bottom_bar_controller.dart';
import 'package:courier_delivery/core/app_export.dart';
import 'package:courier_delivery/presentation/home_container_page/home_container_page.dart';
import 'package:courier_delivery/presentation/my_orders_page/my_orders_page.dart';
import 'package:courier_delivery/presentation/profile_page/profile_page.dart';
import 'package:courier_delivery/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';


class HomeContainer1Screen extends StatefulWidget {
  const HomeContainer1Screen({Key? key}) : super(key: key);

  @override
  State<HomeContainer1Screen> createState() => _HomeContainer1ScreenState();
}

class _HomeContainer1ScreenState extends State<HomeContainer1Screen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteA700,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  List<Widget> screen = [
    HomeContainerPage(),
    MyOrdersPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: screen[controller.selectedIndex],
          bottomNavigationBar: CustomBottomBar(
            onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            },
          ),
        ),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeContainerPage;
      case BottomBarEnum.Order:
        return AppRoutes.myOrdersPage;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeContainerPage:
        return HomeContainerPage();
      case AppRoutes.myOrdersPage:
        return MyOrdersPage();
      case AppRoutes.notificationsPage:
        return NotificationsPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  // ignore: unused_element
  Future<bool> _onBackPressed(BuildContext context) async {
    CustomBottomBarController controller = Get.find<CustomBottomBarController>();
    if (controller.selectedIndex == 0) {
      return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: getHorizontalSize(396),
              padding: getPadding(left: 0, top: 38, right: 0, bottom: 38),
              decoration: AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure want to exit?".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: getPadding(
                      left: 30,
                      top: 28,
                      right: 30,
                      bottom: 2,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              Get.back(result: false);
                            },
                            height: getVerticalSize(46),
                            text: "lbl_no".tr,
                            margin: getMargin(right: 10),
                            variant: ButtonVariant.OutlineDeeppurple600,
                            padding: ButtonPadding.PaddingAll11,
                            fontStyle: ButtonFontStyle.SFProTextBold18Deeppurple600,
                          ),
                        ),
                        SizedBox(width: getHorizontalSize(10)),
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              if (controller.selectedIndex == 0) {
                                closeApp();
                              } else {
                                controller.getIndex(0);
                                Get.back(result: true);
                              }
                            },
                            height: getVerticalSize(46),
                            text: "lbl_yes".tr,
                            margin: getMargin(left: 10),
                            shape: ButtonShape.RoundedBorder8,
                            padding: ButtonPadding.PaddingAll11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      controller.getIndex(0);
      return false;
    }
  }
}





