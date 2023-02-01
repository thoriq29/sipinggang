import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';

class AppNavigation {
  onNavigateAuthChecker(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.authChecker);
  }

  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  onTapDaftar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerscreen);
  }

  onTapJenisPenyakit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jenisPenyakitScreen);
  }

  onTapHasilDiagnosa(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.hasilDiagnosaScreen);
  }
}
