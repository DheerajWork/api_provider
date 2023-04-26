

import 'package:flutter/material.dart';

@immutable
abstract class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class SelectedLocale extends LocaleState {
   SelectedLocale(Locale locale) : super(locale);
}
