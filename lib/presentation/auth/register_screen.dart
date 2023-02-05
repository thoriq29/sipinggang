import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/provider/register_provider.dart';
import 'package:sipinggang/widgets/custom_button.dart';
import 'package:sipinggang/widgets/input_text.dart';

import '../../services/register_service.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: Container(
            width: size.width,
            padding: getPadding(
              top: 32,
              bottom: 32,
            ),
            child: SingleChildScrollView(
              child: Consumer<RegisterProvider>(builder: (_, rP, __) {
                return Form(
                  key: rP.formKey,
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
                          textEditingController: rP.fullName,
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
                                  value: 'male',
                                  groupValue: rP.gender,
                                  onChanged: (value) {
                                    if (value != null) {
                                      rP.gender = value;
                                    }
                                  },
                                ),
                                Text("Laki-laki"),
                                Radio(
                                  value: 'female',
                                  groupValue: rP.gender,
                                  onChanged: (value) {
                                    if (value != null) {
                                      rP.gender = value;
                                    }
                                  },
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
                          textEditingController: rP.placeOfBirth,
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
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? datePiked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now(),
                            );

                            rP.dateOfBirth = datePiked;
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.event,
                                color: ColorConstant.gray9007e,
                              ),
                              SizedBox(width: 14),
                              Text(
                                rP.dateOfBirth != null
                                    ? DateFormat('dd MMMM yyyy').format(
                                        rP.dateOfBirth!,
                                      )
                                    : "Tanggal Lahir",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
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
                          textEditingController: rP.address,
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
                        onTap: () => RegisterService.onSubmitFillPersonalData(
                          context: context,
                          registerProvider: rP,
                        ),
                        height: 58,
                        width: 305,
                        text: "Isi Data Diri",
                        margin: getMargin(
                          top: 21,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
