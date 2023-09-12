import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/provider/auth_provider.dart';
import 'package:sipinggang/services/auth_services.dart';
import 'package:sipinggang/widgets/app_widget.dart';
import 'package:sipinggang/widgets/custom_button.dart';
import 'package:sipinggang/widgets/input_text.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: SafeArea(
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
                    Consumer<AuthProvider>(
                      builder: (_, AuthProvider authProvider, __) {
                        return Container(
                          margin: getMargin(
                            left: 1,
                            top: 50,
                            right: 1,
                          ),
                          padding: getPadding(left: 8, top: 6, bottom: 6),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder24,
                          ),
                          child: CountryListPick(
                            initialSelection: authProvider.countryCode.dialCode,
                            useSafeArea: true,
                            useUiOverlay: false,
                            onChanged: (CountryCode? code) {
                              authProvider.countryCode = code!;
                            },
                            appBar:
                                AppWidget.appBar(title: 'Pilih Kode Negara'),
                            theme: CountryTheme(
                              isShowFlag: true,
                              isShowTitle: true,
                              isShowCode: true,
                              isDownIcon: true,
                              showEnglishName: false,
                            ),
                            pickerBuilder: (context, countryCode) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 14),
                                  Image.asset(
                                    countryCode!.flagUri!,
                                    package: 'country_list_pick',
                                    scale: 10,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    countryCode.dialCode!,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      countryCode.name!,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: ColorConstant.black900,
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: getMargin(
                        left: 1,
                        top: 16,
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
                        child: Consumer<AuthProvider>(
                          builder: (_, authProvider, __) {
                            return InputText(
                              textEditingController:
                                  authProvider.phoneNumberController,
                              prefix: Icon(
                                Icons.phone,
                                size: 25,
                              ),
                              hintText: "No Handphone",
                            );
                          },
                        ),
                      ),
                    ),
                    Consumer<AuthProvider>(
                      builder: (_, AuthProvider authProvider, __) {
                        return CustomButton(
                          height: 58,
                          width: 305,
                          text: "Masuk",
                          margin: getMargin(
                            top: 51,
                          ),
                          onTap: () => AuthService.onSubmitLogin(
                            context,
                            authProvider,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
