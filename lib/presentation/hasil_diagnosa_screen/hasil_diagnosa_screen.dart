import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sipinggang/provider/diagnosis_info_provider.dart';
import 'package:sipinggang/widgets/custom_button.dart';

class HasilDiagnosaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.blue700,
        body: Consumer<DiagnosisInfoProvider>(
          builder: (context, provider, _) {
            if (provider.resultDataIsEmpty) {
              return Center(
                child: Text("Anda Sehat"),
              );
            }
            return Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    margin: getMargin(top: 22),
                    padding: getPadding(top: 40, bottom: 40),
                    decoration: AppDecoration.outlineBlack9000f.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: getVerticalSize(6.00),
                          width: getHorizontalSize(45.00),
                          decoration: BoxDecoration(
                            color: ColorConstant.black90063,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(3.00),
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Padding(
                        //     padding: getPadding(left: 16, top: 31),
                        //     child: Row(
                        //       children: [
                        //         CustomImageView(
                        //           svgPath: ImageConstant.imgArrowleft,
                        //           height: getSize(24.00),
                        //           width: getSize(24.00),
                        //           onTap: () {
                        //             onTapImgArrowleft(context);
                        //           },
                        //         ),
                        //         Padding(
                        //           padding: getPadding(left: 12, top: 1),
                        //           child: Text(
                        //             "Hasil Diagnosa",
                        //             overflow: TextOverflow.ellipsis,
                        //             textAlign: TextAlign.left,
                        //             style: AppStyle.txtRobotoRomanMedium18
                        //                 .copyWith(
                        //               height: getVerticalSize(
                        //                 1.00,
                        //               ),
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: getVerticalSize(494.00),
                          width: size.width,
                          margin: getMargin(top: 19),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: getVerticalSize(1.00),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray90063),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: getMargin(left: 7, right: 7),
                                  padding: getPadding(
                                      left: 30, top: 11, right: 30, bottom: 11),
                                  decoration:
                                      AppDecoration.fillWhiteA700.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder24,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: getHorizontalSize(129.00),
                                        child: Text(
                                          "Hasil Diagnosa",
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                          style: AppStyle.txtCairoBold20Blue700
                                              .copyWith(
                                            height: getVerticalSize(1.00),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: getHorizontalSize(297.00),
                                        margin: getMargin(top: 18, bottom: 148),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "Anda terdiagnosa ${provider.typeHasil} mengalami :\n",
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(16),
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w700,
                                                  height: getVerticalSize(1.00),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${provider.result?['title']}\n\n\n",
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(16),
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w600,
                                                  height: getVerticalSize(1.00),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Solusi :\n",
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(16),
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w700,
                                                  height: getVerticalSize(1.00),
                                                ),
                                              ),
                                              TextSpan(
                                                text: provider.result?["solusi"]
                                                    .join("\n"),
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(16),
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w400,
                                                  height: getVerticalSize(1.00),
                                                ),
                                              )
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          height: 58,
                          width: 305,
                          text: "Simpan",
                          margin: getMargin(
                            top: 20,
                            // bottom: 58,
                          ),
                        ),
                        CustomButton(
                          onTap: () => AppNavigation().onTapHome(context),
                          height: 58,
                          width: 305,
                          text: "Kembali ke Home",
                          margin: getMargin(
                            top: 10,
                            bottom: 45,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
