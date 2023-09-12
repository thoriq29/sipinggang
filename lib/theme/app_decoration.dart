import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillBlue700 => BoxDecoration(
        color: ColorConstant.blue700,
      );
  static BoxDecoration get outlineBlack9000f => BoxDecoration(
        color: ColorConstant.whiteA700Ab,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              -20,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get gradientGray50Gray50 => BoxDecoration(
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
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderTL50 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        50.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        50.00,
      ),
    ),
  );

  static BorderRadius roundedBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );
}
