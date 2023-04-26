import 'package:api_provider/my_bloc/cubit/locale_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Locale;

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(super.initialState);

  // final SharedPreferences sharedPreferences;
  // LocaleCubit({required this.sharedPreferences})
  //     : super(SelectedLocale(const Locale('en')));

  void toSomalia() async {
    // await sharedPreferences.setString(
    //   'lang',
    //   'sw',
    // );
    emit(SelectedLocale(const Locale('sw')));
  }

  void toEnglish() async {
    // await sharedPreferences.setString(
    //   'lang',
    //   'en',
    // );
    emit(SelectedLocale(const Locale('en')));
  }

  onLoad() {
    // final selectedLanguage = sharedPreferences.getString('lang') ?? 'en';
    // emit(SelectedLocale(Locale(selectedLanguage)));
  }
  // void toSomalia() => emit(SelectedLocale(const Locale('sw')));

  // void toEnglish() => emit(SelectedLocale(const Locale('en')));
}
