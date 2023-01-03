import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageProvider = StateNotifierProvider<CurrentLanguage, Locale>(
  (ref) => CurrentLanguage(),
);

class CurrentLanguage extends StateNotifier<Locale> {
  CurrentLanguage() : super(const Locale("en"));

  void changeLanguage(Locale locale) {
    state = locale;
  }
}
