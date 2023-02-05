import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/databases/users_database.dart';
import 'package:sipinggang/model/user_data.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sipinggang/provider/register_provider.dart';
import 'package:sipinggang/widgets/app_widget.dart';

class RegisterService {
  static void onSubmitFillPersonalData({
    required BuildContext context,
    required RegisterProvider registerProvider,
  }) async {
    UserData userData = Provider.of<UserData>(context, listen: false);

    bool textFieldChecked = registerProvider.formKey.currentState!.validate();
    bool datePickChecked = registerProvider.dateOfBirth != null;

    print(userData.docUid);

    if (textFieldChecked && datePickChecked) {
      try {
        await UsersDatabase().updateUser(userData.docUid, {
          'fullName': registerProvider.fullName.text,
          'gender': registerProvider.gender,
          'placeOfBirth': registerProvider.placeOfBirth.text,
          'dateOfBirth': registerProvider.dateOfBirth,
          'address': registerProvider.address.text,
        });
        AppNavigation().onNavigateAuthChecker(context);
      } catch (e) {
        print(e);
      }
    } else {
      AppWidget.showSnackBar(
        context: context,
        content: Text(
          'Maaf ada yang kurang dalam pengisian form data diri, mohon di perbaiki.',
        ),
        duration: Duration(seconds: 3),
      );
    }
  }
}
