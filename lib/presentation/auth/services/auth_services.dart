import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/presentation/auth/providers/auth_provider.dart';
import 'package:sipinggang/widgets/app_widget.dart';

class AuthService {
  // Fungsi onsubmit untuk menjalankan verifikasi phone dan melanjutkan ke verifi OTP
  static Future<void> onSubmitLogin(
    BuildContext context,
    AuthProvider authProvider,
  ) async {
    String phone = authProvider.phoneNumberController.text;
    if (phone.isNotEmpty) {
      AppWidget.loadingPageIndicator(context: context);
      // Check phone input with "0" or no
      if (phone.trim()[0] == '0') {
        // Memanggil fungsi verify phone number di auth provider
        Provider.of<AuthProvider>(context, listen: false).verifyPhone(
          context,
          '${authProvider.countryCode}${phone.trim().substring(1, phone.trim().length).trim()}',
        );
      } else {
        // Memanggil fungsi verify phone number di auth provider
        Provider.of<AuthProvider>(context, listen: false).verifyPhone(
          context,
          '${authProvider.countryCode}${phone.trim()}',
        );
      }
    } else {
      AppWidget.showSnackBar(
        context: context,
        content: Text('Nomor harus di isi'),
        duration: Duration(seconds: 3),
      );
    }
  }

  // Fungsi onsubmit untuk menjalankan verifikasi OTP
  static void onSubmitVerifyPhone(
    BuildContext context,
    AuthProvider authProvider,
  ) {
    String phone = authProvider.phoneNumberController.text;
    String otpCode = authProvider.otpCodeController.text;

    if (otpCode.length > 5) {
      // Memanggil fungsi verify otp number di auth provider
      Provider.of<AuthProvider>(context, listen: false).verifyOTP(
        context,
        phone,
        otpCode,
      );

      // clear phone controller
      authProvider.phoneNumberController.clear();
    } else {
      AppWidget.showSnackBar(
        context: context,
        content: Text('Kode OTP yang dimasukkan kurang.'),
        duration: Duration(seconds: 3),
      );
    }
  }
}
