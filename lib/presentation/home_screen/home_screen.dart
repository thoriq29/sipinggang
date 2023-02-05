import 'package:flutter/material.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sipinggang/provider/auth_provider.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppNavigation().onTapJenisPenyakit(context);
          },
          child: Icon(Icons.add),
        ),
        body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return ListView(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
