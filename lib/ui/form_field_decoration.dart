import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class FormFieldDecoration {
  Widget prefix;
  String label;

  FormFieldDecoration( this.prefix, this.label );

  InputDecoration build() {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(),
      prefixIcon: prefix,
      contentPadding: EdgeInsets.only(bottom: 5),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppThemeProvider.grey)
      ),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppThemeProvider.grey)
      ),
      border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppThemeProvider.grey)
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppThemeProvider.grey)
      )
    );
  }
}