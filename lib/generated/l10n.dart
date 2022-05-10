// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current!;
    });
  }

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `please enter email`
  String get enterEmail {
    return Intl.message(
      'please enter email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `please enter password`
  String get enterPassword {
    return Intl.message(
      'please enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `your city:`
  String get yourCity {
    return Intl.message(
      'your city:',
      name: 'yourCity',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `choose mall`
  String get chooseMall {
    return Intl.message(
      'choose mall',
      name: 'chooseMall',
      desc: '',
      args: [],
    );
  }

  /// `Riad`
  String get riad {
    return Intl.message(
      'Riad',
      name: 'riad',
      desc: '',
      args: [],
    );
  }

  /// `My competitions`
  String get myCompetitions {
    return Intl.message(
      'My competitions',
      name: 'myCompetitions',
      desc: '',
      args: [],
    );
  }

  /// `Be the Winner title`
  String get beTheWinnerTitle {
    return Intl.message(
      'Be the Winner title',
      name: 'beTheWinnerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Be the Winner message`
  String get beTheWinnerMessage {
    return Intl.message(
      'Be the Winner message',
      name: 'beTheWinnerMessage',
      desc: '',
      args: [],
    );
  }

  /// `Start A competition`
  String get startACompetition {
    return Intl.message(
      'Start A competition',
      name: 'startACompetition',
      desc: '',
      args: [],
    );
  }

  /// `Malls`
  String get malls {
    return Intl.message(
      'Malls',
      name: 'malls',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
