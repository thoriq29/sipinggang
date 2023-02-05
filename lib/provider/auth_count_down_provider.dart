import 'dart:async';
import 'package:flutter/material.dart';

class AuthCountDown with ChangeNotifier {
  // Dekralasi variable awal count down
  int _countDown = 60;
  // Getter variable coundown
  int get countDown => _countDown;
  // Setter variable coundown
  set countDown(int newValue) {
    _countDown = newValue;
    notifyListeners();
  }

  // Getter string with confert diration to string
  String timerText(Duration clockTimer) {
    if (countDown > 0) {
      return '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';
    } else {
      return 'Kembali dan verifikasi ulang nomor HP-mu jika masih belum menerima kode OTP.';
    }
  }

  // fungsi stream coun down
  Stream<int> get streamCountDown {
    return Stream<int>.periodic(
      Duration(seconds: 1),
      (count) {
        return countDown--;
      },
    ).take(61);
  }
}
