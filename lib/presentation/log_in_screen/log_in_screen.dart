import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:courier_delivery/core/app_export.dart';
import 'package:courier_delivery/core/utils/validation_functions.dart';
import 'package:courier_delivery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_floating_edit_text.dart';
import 'controller/log_in_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LogInController controller = Get.put(LogInController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    // WillPopScope(
    //     onWillPop: () async {
    //       closeApp();
    //       return true;
    //     },
    //     child:
         ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 16, top: 41, right: 16, bottom: 41),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(top: 5),
                                  child: Text("lbl_log_in".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold28)),
                              Padding(
                                  padding: getPadding(top: 22),
                                  child: Text("msg_welcome_back_let_s".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody)),
                              CustomFloatingEditText(
                                  controller: controller.emailController,
                                  labelText: "lbl_email_address".tr,
                                  hintText: "lbl_email_address".tr,
                                  margin: getMargin(top: 38),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getSize(54),
                                      minHeight: getSize(54)),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              Obx(
                                () => CustomFloatingEditText(
                                    controller: controller.passwordController,
                                    labelText: "lbl_password".tr,
                                    hintText: "lbl_password".tr,
                                    margin: getMargin(top: 24),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getSize(54),
                                        minHeight: getSize(54)),
                                    isObscureText:
                                        controller.isShowPassword.value,
                                    textInputType: TextInputType.emailAddress,
                                    suffix: InkWell(
                                        onTap: () {
                                          controller.isShowPassword.value =
                                              !controller.isShowPassword.value;
                                        },
                                        child: Container(
                                            margin:
                                                getMargin(left: 16, right: 16),
                                            child: CustomImageView(
                                                svgPath: controller
                                                        .isShowPassword.value
                                                    ? ImageConstant
                                                        .imgIcPasswordStoke
                                                    : ImageConstant
                                                        .imgIcPasswordStoke))),
                                    suffixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(63)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter valid password";
                                      } else if (value.length < 8) {
                                        return "Please enter 8 digit password";
                                      }
                                      return null;
                                    }),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtForgotpassword();
                                      },
                                      child: Padding(
                                          padding: getPadding(top: 19),
                                          child: Text("msg_forgot_password".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtBody)))),
                              CustomButton(
                                  height: getVerticalSize(54),
                                  text: "lbl_log_in".tr,
                                  margin: getMargin(top: 31),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      PrefUtils.setIsSignIn(false);
                                      onTapLogin();
                                    }
                                  }),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("lbl_or".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                     style: Theme.of(context).textTheme.titleLarge,
                                      )),
                              Padding(
                                  padding: getPadding(top: 19),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: CustomButton(
                                                height: getVerticalSize(54),
                                                text: "lbl_google".tr,
                                                margin: getMargin(right: 8),
                                                variant:
                                                    ButtonVariant.FillGray50,
                                                padding:
                                                    ButtonPadding.PaddingT17,
                                                fontStyle: ButtonFontStyle
                                                    .SFProTextSemibold16,
                                                prefixWidget: Container(
                                                    margin:
                                                        getMargin(right: 16),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgGoogle)),
                                                onTap: () {
                                                  onTapGoogle();
                                                })),
                                        Expanded(
                                            child: CustomButton(
                                                height: getVerticalSize(54),
                                                text: "lbl_apple".tr,
                                                margin: getMargin(left: 8),
                                                variant:
                                                    ButtonVariant.FillGray50,
                                                padding:
                                                    ButtonPadding.PaddingT17,
                                                fontStyle: ButtonFontStyle
                                                    .SFProTextSemibold16,
                                                prefixWidget: Container(
                                                    margin:
                                                        getMargin(right: 16),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgFire)),
                                                onTap: () {
                                                  onTapApple();
                                                }))
                                      ])),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount();
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(16),
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: "lbl_sign_up".tr,
                                            style: TextStyle(
                                                color:
                                                    ColorConstant.deepPurple600,
                                                fontSize: getFontSize(16),
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400))
                                      ]),
                                      textAlign: TextAlign.left))
                            ])))));
                            // );
  }

  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapLogin() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  onTapGoogle() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  onTapApple() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
