import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/model/user_data.dart';
import 'package:sipinggang/presentation/auth/login_screen.dart';

import 'package:sipinggang/presentation/auth/register_screen.dart';
import 'package:sipinggang/presentation/auth/auth_checker.dart';
import 'package:sipinggang/presentation/home_screen/home_screen.dart';

import 'package:sipinggang/presentation/intro_screen/intro_screen.dart';

import 'package:sipinggang/presentation/jenis_penyakit_screen/jenis_penyakit_screen.dart';
import 'package:sipinggang/presentation/hasil_diagnosa_screen/hasil_diagnosa_screen.dart';
import 'package:sipinggang/presentation/splash_screen/splash_screen.dart';
import 'package:sipinggang/provider/auth_provider.dart';
import 'package:sipinggang/provider/diagnosis.dart';

class AppRoutes {
  static const String authChecker = AuthChecker.routeName;

  static const String splashScreen = SplashScreen.routeName;

  static const String introScreen = '/intro_screen';

  static const String registerScreen = '/daftar_screen';

  static const String homeScreen = HomeScreen.routeName;

  static const String loginScreen = '/masuk_screen';

  static const String jenisPenyakitScreen = '/jenis_penyakit_screen';

  static const String hasilDiagnosaScreen = '/hasil_diagnosa_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    authChecker: (context) {
      return StreamProvider<UserData>.value(
          value: AuthProvider().user,
          initialData: UserData.initialData,
          child: AuthChecker());
    },
    splashScreen: (context) => SplashScreen(),
    introScreen: (context) => IntroScreen(),
    registerScreen: (context) => RegisterScreen(),
    homeScreen: (context) => HomeScreen(),
    loginScreen: (context) => LoginScreen(),
    jenisPenyakitScreen: (context) => ChangeNotifierProvider(
          create: (_) => DiagnosisProvider(),
          child: JenisPenyakitScreen(),
        ),
    hasilDiagnosaScreen: (context) => HasilDiagnosaScreen(),
  };
}
