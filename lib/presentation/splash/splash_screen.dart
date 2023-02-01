import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/presentation/splash/providers/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (_) => SplashProvider(context),
      child: Scaffold(
        body: Consumer<SplashProvider>(
          builder: (_, sP, __) {
            return Center(
              child: Image.asset(
                ImageConstant.imgSipinggang1,
                width: 200,
                height: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}
