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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Localized {
  Localized();

  static Localized? _current;

  static Localized get current {
    assert(_current != null,
        'No instance of Localized was loaded. Try to initialize the Localized delegate before accessing Localized.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Localized> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Localized();
      Localized._current = instance;

      return instance;
    });
  }

  static Localized of(BuildContext context) {
    final instance = Localized.maybeOf(context);
    assert(instance != null,
        'No instance of Localized present in the widget tree. Did you add Localized.delegate in localizationsDelegates?');
    return instance!;
  }

  static Localized? maybeOf(BuildContext context) {
    return Localizations.of<Localized>(context, Localized);
  }

  /// `Дневник настроения`
  String get moodDiary {
    return Intl.message(
      'Дневник настроения',
      name: 'moodDiary',
      desc: '',
      args: [],
    );
  }

  /// `Статистика`
  String get static {
    return Intl.message(
      'Статистика',
      name: 'static',
      desc: '',
      args: [],
    );
  }

  /// `Что чувствуешь?`
  String get youFeel {
    return Intl.message(
      'Что чувствуешь?',
      name: 'youFeel',
      desc: '',
      args: [],
    );
  }

  /// `Настроение`
  String get mood {
    return Intl.message(
      'Настроение',
      name: 'mood',
      desc: '',
      args: [],
    );
  }

  /// `Бешенство`
  String get anger {
    return Intl.message(
      'Бешенство',
      name: 'anger',
      desc: '',
      args: [],
    );
  }

  /// `Спокойствие`
  String get calmness {
    return Intl.message(
      'Спокойствие',
      name: 'calmness',
      desc: '',
      args: [],
    );
  }

  /// `Страх`
  String get fear {
    return Intl.message(
      'Страх',
      name: 'fear',
      desc: '',
      args: [],
    );
  }

  /// `Радость`
  String get happy {
    return Intl.message(
      'Радость',
      name: 'happy',
      desc: '',
      args: [],
    );
  }

  /// `Грусть`
  String get sadness {
    return Intl.message(
      'Грусть',
      name: 'sadness',
      desc: '',
      args: [],
    );
  }

  /// `Сила`
  String get strong {
    return Intl.message(
      'Сила',
      name: 'strong',
      desc: '',
      args: [],
    );
  }

  /// `Уровень стресса`
  String get stressLevel {
    return Intl.message(
      'Уровень стресса',
      name: 'stressLevel',
      desc: '',
      args: [],
    );
  }

  /// `Низкий`
  String get lowLevel {
    return Intl.message(
      'Низкий',
      name: 'lowLevel',
      desc: '',
      args: [],
    );
  }

  /// `Высокий`
  String get hightLevel {
    return Intl.message(
      'Высокий',
      name: 'hightLevel',
      desc: '',
      args: [],
    );
  }

  /// `Самооценка`
  String get selfAssessment {
    return Intl.message(
      'Самооценка',
      name: 'selfAssessment',
      desc: '',
      args: [],
    );
  }

  /// `Уверенность`
  String get confidence {
    return Intl.message(
      'Уверенность',
      name: 'confidence',
      desc: '',
      args: [],
    );
  }

  /// `Неувереннось`
  String get uncertainty {
    return Intl.message(
      'Неувереннось',
      name: 'uncertainty',
      desc: '',
      args: [],
    );
  }

  /// `Заметки`
  String get notes {
    return Intl.message(
      'Заметки',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Введите заметку`
  String get enterNotes {
    return Intl.message(
      'Введите заметку',
      name: 'enterNotes',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get safe {
    return Intl.message(
      'Сохранить',
      name: 'safe',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localized> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Localized> load(Locale locale) => Localized.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}