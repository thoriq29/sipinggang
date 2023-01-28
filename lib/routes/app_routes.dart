import 'package:flutter/material.dart';
import 'package:sipinggang/presentation/intro_screen/intro_screen.dart';
import 'package:sipinggang/presentation/register_screen/register_screen.dart';
import 'package:sipinggang/presentation/jenis_penyakit_screen/jenis_penyakit_screen.dart';
import 'package:sipinggang/presentation/hasil_diagnosa_screen/hasil_diagnosa_screen.dart';
import 'package:sipinggang/presentation/login_screen/login_screen.dart';

class AppRoutes {
  static const String introScreen = '/login_screen';

  static const String registerscreen = '/daftar_screen';

  static const String loginScreen = '/masuk_screen';

  static const String jenisPenyakitScreen = '/jenis_penyakit_screen';

  static const String hasilDiagnosaScreen = '/hasil_diagnosa_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    introScreen: (context) => IntroScreen(),
    registerscreen: (context) => RegisterScreen(),
    loginScreen: (context) => LoginScreen(),
    jenisPenyakitScreen: (context) => JenisPenyakitScreen(),
    hasilDiagnosaScreen: (context) => HasilDiagnosaScreen(),
  };
}
