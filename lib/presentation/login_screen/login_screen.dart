import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/widgets/custom_button.dart';
import 'package:sipinggang/widgets/input_text.dart';

import '../app_navigation_screen/app_navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            gradient: LinearGradient(
              begin: Alignment(
                0.5,
                0.15,
              ),
              end: Alignment(
                0.51,
                0.82,
              ),
              colors: [
                ColorConstant.gray50,
                ColorConstant.gray50,
              ],
            ),
          ),
          child: Container(
            width: size.width,
            padding: getPadding(
              left: 34,
              top: 87,
              right: 34,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSipinggang1,
                    width: getHorizontalSize(
                      200.00,
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      left: 1,
                      top: 50,
                      right: 1,
                    ),
                    padding: getPadding(
                      left: 30,
                      top: 8,
                      right: 30,
                      bottom: 8,
                    ),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder24,
                    ),
                    child: Container(
                      // width: getHorizontalSize(
                      //   89.00,
                      // ),
                      margin: getMargin(
                        // left: 63,
                        top: 2,
                        // right: 71,
                      ),
                      child: InputText(
                        prefix : CustomImageView(
                          svgPath: ImageConstant.imgUser,
                        ),
                        hintText: "No Handphone",
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: getMargin(
                      top: 10,
                    ),
                    color: ColorConstant.whiteA700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          24.00,
                        ),
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        58.00,
                      ),
                      width: getHorizontalSize(
                        305.00,
                      ),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder24,
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: getPadding(
                              left: 31,
                              top: 8,
                              right: 31,
                              bottom: 8,
                            ),
                            decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24,
                            ),
                            child: InputText(
                              prefix : CustomImageView(
                                svgPath: ImageConstant.imgLock,
                              ),
                              hintText: "Password",
                            ),
                          ),
                      ),
                    ),
                  ),
                  CustomButton(
                    height: 58,
                    width: 305,
                    text: "Masuk",
                    margin: getMargin(
                      top: 51,
                    ),
                    onTap: () {
                      AppNavigation().onTapJenisPenyakit(context);
                    },
                  ),
                  Padding(
                    padding: getPadding(
                      top: 26,
                      bottom: 5,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          AppNavigation().onTapDaftar(context);
                        },                      
                        child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Belum punya akun ? ",
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w100,
                                height: getVerticalSize(
                                  1.00,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "Daftar",
                              style: TextStyle(
                                color: ColorConstant.blue700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: getVerticalSize(
                                  1.00,
                                ),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
