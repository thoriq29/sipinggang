import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blue700 = fromHex('#2778bd');

  static Color gray9007e = fromHex('#7e2c2929');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700Ab = fromHex('#abffffff');

  static Color black90063 = fromHex('#63000000');

  static Color gray900 = fromHex('#2c2929');

  static Color black9000f = fromHex('#0f000000');

  static Color gray90063 = fromHex('#632c2929');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray50 = fromHex('#fafbfd');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
