import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/model/user_data.dart';
import 'package:sipinggang/presentation/auth/login_screen.dart';
import 'package:sipinggang/presentation/auth/register_screen.dart';
import 'package:sipinggang/presentation/home_screen/home_screen.dart';
import 'package:sipinggang/provider/auth_provider.dart';
import 'package:sipinggang/widgets/app_widget.dart';

// Auth status pengecekan
class AuthChecker extends StatelessWidget {
  static const String routeName = '/auth_checker';
  static const featureName = 'Auth Checker';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, AuthProvider authProvider, __) {
        // Pengecekan variable auth status untuk menentukan route ke halaman
        if (authProvider.auth.currentUser != null) {
          print('logedin');
          UserData userData = Provider.of<UserData>(context);
          if (userData == UserData.initialData) {
            return Scaffold(body: AppWidget.noData());
          } else if (userData.status == 'active' && userData.fullName.isEmpty) {
            return RegisterScreen();
          } else {
            return StreamProvider<UserData>.value(
              value: AuthProvider().user,
              initialData: UserData.initialData,
              child: HomeScreen(),
            );
          }
        } else {
          print('NOT logedin');
          // masuk ke halaman login jika user auth tidak terisi
          return LoginScreen();
        }
      },
    );
  }
}
