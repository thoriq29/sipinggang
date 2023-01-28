import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sipinggang/widgets/custom_button.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 35,
            right: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgSipinggang1,
                width: getHorizontalSize(
                  282.00,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 87,
                ),
                child: Text(
                  "Selamat Datang",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanBold32.copyWith(
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: getHorizontalSize(
                    247.00,
                  ),
                  margin: getMargin(
                    left: 22,
                    top: 38,
                  ),
                  child: Text(
                    "Deteksi penyakit pinggangmu\nsekarang juga",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtRobotoItalicThin20.copyWith(
                      height: getVerticalSize(
                        1.00,
                      ),
                    ),
                  ),
                ),
              ),
              CustomButton(
                height: 58,
                width: 305,
                text: "Login",
                margin: getMargin(
                  top: 29,
                ),
                onTap: () {
                  AppNavigation().onTapLogin(context);
                },
              ),
              CustomButton(
                height: 58,
                width: 305,
                text: "Daftar",
                margin: getMargin(
                  top: 16,
                  bottom: 2,
                ),
                onTap: () {
                  AppNavigation().onTapDaftar(context);
                },
                variant: ButtonVariant.FillWhiteA700,
                fontStyle: ButtonFontStyle.RobotoRomanBold20Blue700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
