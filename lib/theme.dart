import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemeProvider {
  static const teal = Color(0xff11998e);
  static const darkTeal = Color(0xff30383b);
  static const lime = Color(0xff38ef7d);
  static const facebookBlue = Color(0xff4267b2);
  static const googleRed = Color(0xffdb4437);



  static final current = ThemeData(
    accentColor: teal,
    backgroundColor: Colors.white,
  );
}