import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';

class SplashProvider with ChangeNotifier {
  final BuildContext context;

  SplashProvider(this.context) {
    _startTimer();
  }

  Timer _startTimer() {
    Duration _timer = const Duration(seconds: 3);
    return Timer(_timer, _navigate);
  }

  void _navigate() {
    AppNavigation().onNavigateAuthChecker(context);
  }
}
