import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/model/user_model.dart';
import 'package:sipinggang/presentation/auth/login_screen.dart';
import 'package:sipinggang/presentation/auth/providers/auth_provider.dart';
import 'package:sipinggang/presentation/auth/register_screen.dart';
import 'package:sipinggang/presentation/home/home_screen.dart';

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
          if (userData.fullName.isEmpty) {
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
