import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/presentation/auth/providers/auth_count_down_provider.dart';
import 'package:sipinggang/presentation/auth/providers/auth_provider.dart';
import 'package:sipinggang/presentation/auth/services/auth_services.dart';
import 'package:sipinggang/widgets/custom_button.dart';
import 'package:sipinggang/widgets/input_text.dart';

class VerificationScreen extends StatelessWidget {
  final String beUserPhone;

  VerificationScreen({
    required this.beUserPhone,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthCountDown(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5, top: 48),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, top: 15),
              child: Text(
                "Kode OTP sudah di kirim!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Text(
                "Masukkan kode OTP yang kami kirim ke nomor HP-mu, $beUserPhone.",
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, top: 30),
              child: RichText(
                text: TextSpan(
                  text: 'Kode OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorConstant.bluegray400,
                  ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: getMargin(
                left: 16,
                top: 16,
                right: 16,
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
                      textEditingController: authProvider.otpCodeController,
                      prefix: Icon(
                        Icons.phone,
                        size: 25,
                      ),
                      hintText: "Kode OTP",
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 20, top: 10, left: 16),
                child: Consumer<AuthCountDown>(
                  builder: (_, AuthCountDown authCountDown, __) {
                    return StreamProvider<int>(
                      create: (_) => authCountDown.streamCountDown,
                      initialData: 60,
                      child: Consumer<int>(
                        builder: (context, int countDown, __) {
                          Duration clockTimer = Duration(
                            seconds: countDown,
                          );
                          return Text(
                            authCountDown.timerText(
                              clockTimer,
                            ),
                            textAlign: TextAlign.right,
                            style: TextStyle(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: getMargin(
                left: 16,
                // top: 16,
                right: 16,
              ),
              child: Center(
                child: Consumer<AuthProvider>(
                  builder: (_, AuthProvider authProvider, __) {
                    return CustomButton(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      text: "Verifikasi",
                      margin: getMargin(
                        top: 16,
                      ),
                      onTap: () => AuthService.onSubmitVerifyPhone(
                        context,
                        authProvider,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
