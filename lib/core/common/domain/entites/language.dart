import 'package:flutter/material.dart';

class Languages {
  late List<Language> languagesData = [];

  Languages() {

    final Language ar = Language(
      id: 2,
      backendLangCode: 'ar',
      shortDisplayLabel: 'Ar',
      fullDisplayLabel: 'عربي',
      local: const Locale('ar', 'SY'),
      flagImagePath: 'assets/images/icons/saudi arabia.svg',
    );

    final Language en = Language(
      id: 3,
      backendLangCode: 'en',
      shortDisplayLabel: 'En',
      fullDisplayLabel: 'English',
      local: const Locale('en', 'US'),
      flagImagePath: 'assets/images/icons/united kingdom.svg',
    );

    languagesData.addAll([ en, ar]);
  }
}

class Language {
  final int id;
  final String backendLangCode;
  final String shortDisplayLabel;
  final String fullDisplayLabel;
  final Locale local;
  final String flagImagePath;

  Language({
    required this.id,
    required this.backendLangCode,
    required this.shortDisplayLabel,
    required this.fullDisplayLabel,
    required this.local,
    required this.flagImagePath,
  });
}
