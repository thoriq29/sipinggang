import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/presentation/home/home_screen.dart';
import 'package:sipinggang/widgets/custom_button.dart';

import '../../widgets/input_text.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String gender = "male";
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          padding: getPadding(
            top: 32,
            bottom: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgSipinggang1,
                  width: getHorizontalSize(
                    147.00,
                  ),
                  margin: getMargin(
                    top: 6,
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 36,
                    top: 10,
                    right: 34,
                  ),
                  padding: getPadding(
                    left: 28,
                    top: 6,
                    right: 28,
                    bottom: 6,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: InputText(
                    prefix: Icon(
                      Icons.person,
                      size: 20,
                    ),
                    hintText: "Nama Lengkap",
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 36,
                    top: 10,
                    right: 34,
                  ),
                  padding: getPadding(
                    left: 28,
                    top: 6,
                    right: 28,
                    // bottom: 4,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 0,
                        ),
                        child: Text(
                          "Jenis Kelamin",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtCairoBold20.copyWith(
                            fontSize: 16,
                            height: getVerticalSize(
                              1.00,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: "male",
                            groupValue: gender,
                            onChanged: (value) {},
                          ),
                          Text("Laki-laki"),
                          Radio(
                            value: "female",
                            groupValue: gender,
                            onChanged: (value) {},
                          ),
                          Text("Perempuan"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 36,
                    top: 8,
                    right: 34,
                  ),
                  padding: getPadding(
                    left: 28,
                    top: 6,
                    right: 28,
                    bottom: 6,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: InputText(
                    prefix: Icon(
                      Icons.location_city,
                      size: 20,
                    ),
                    hintText: "Tempat Lahir",
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 36,
                    top: 10,
                    right: 34,
                  ),
                  padding: getPadding(
                    left: 28,
                    top: 6,
                    right: 28,
                    bottom: 6,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: InputText(
                    prefix: Icon(
                      Icons.home,
                      size: 20,
                    ),
                    hintText: "Alamat",
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    1.00,
                  ),
                  width: size.width,
                  margin: getMargin(
                    top: 31,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.gray90063,
                  ),
                ),
                CustomButton(
                  onTap: () {
                    // AuthProvider().logOut(context);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  height: 58,
                  width: 305,
                  text: "Isi Data Diri",
                  margin: getMargin(
                    top: 21,
                  ),
                ),
                // Padding(
                //   padding: getPadding(
                //     top: 26,
                //   ),
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: RichText(
                //       text: TextSpan(
                //         children: [
                //           TextSpan(
                //             text: "Sudah punya akun ?",
                //             style: TextStyle(
                //               color: ColorConstant.black900,
                //               fontSize: getFontSize(
                //                 15,
                //               ),
                //               fontFamily: 'Roboto',
                //               fontWeight: FontWeight.w100,
                //               height: getVerticalSize(
                //                 1.00,
                //               ),
                //             ),
                //           ),
                //           TextSpan(
                //             text: "Masuk",
                //             style: TextStyle(
                //               color: ColorConstant.blue700,
                //               fontSize: getFontSize(
                //                 15,
                //               ),
                //               fontFamily: 'Roboto',
                //               fontWeight: FontWeight.w700,
                //               height: getVerticalSize(
                //                 1.00,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       textAlign: TextAlign.left,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
