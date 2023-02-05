import 'package:flutter/material.dart';
import 'package:sipinggang/presentation/auth/providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        AuthProvider().logOut(context);
      },
      child: Scaffold(
        body: Center(
          child: Text(
            'Home',
          ),
        ),
      ),
    );
  }
}
