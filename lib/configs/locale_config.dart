import 'package:flutter/material.dart';

class AppLocale {
  final Locale locale;
  final String name;

  AppLocale(this.locale, this.name);
}

final appLocaleList = [
  AppLocale(
    const Locale('en'),
    "English",
  ),
  AppLocale(
    const Locale('ko'),
    "한국어",
  ),
];
