import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController _fullName = TextEditingController();
  TextEditingController get fullName => _fullName;

  set fullName(TextEditingController value) {
    _fullName = value;
    notifyListeners();
  }

  String _gender = 'male';
  String get gender => _gender;

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  TextEditingController _placeOfBirth = TextEditingController();
  TextEditingController get placeOfBirth => _placeOfBirth;

  set placeOfBirth(TextEditingController value) {
    _placeOfBirth = value;
    notifyListeners();
  }

  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;

  set dateOfBirth(DateTime? value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  TextEditingController _address = TextEditingController();
  TextEditingController get address => _address;

  set address(TextEditingController value) {
    _address = value;
    notifyListeners();
  }
}
