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

  /// `Возбуждение`
  String get excitement {
    return Intl.message(
      'Возбуждение',
      name: 'excitement',
      desc: '',
      args: [],
    );
  }

  /// `Восторг`
  String get delight {
    return Intl.message(
      'Восторг',
      name: 'delight',
      desc: '',
      args: [],
    );
  }

  /// `Игривост`
  String get playfulness {
    return Intl.message(
      'Игривост',
      name: 'playfulness',
      desc: '',
      args: [],
    );
  }

  /// `Наслаждение`
  String get enjoyment {
    return Intl.message(
      'Наслаждение',
      name: 'enjoyment',
      desc: '',
      args: [],
    );
  }

  /// `Очарование`
  String get charm {
    return Intl.message(
      'Очарование',
      name: 'charm',
      desc: '',
      args: [],
    );
  }

  /// `Осознанность`
  String get awareness {
    return Intl.message(
      'Осознанность',
      name: 'awareness',
      desc: '',
      args: [],
    );
  }

  /// `Смелость`
  String get courage {
    return Intl.message(
      'Смелость',
      name: 'courage',
      desc: '',
      args: [],
    );
  }

  /// `Удовольствие`
  String get pleasure {
    return Intl.message(
      'Удовольствие',
      name: 'pleasure',
      desc: '',
      args: [],
    );
  }

  /// `Чувственность`
  String get sensuality {
    return Intl.message(
      'Чувственность',
      name: 'sensuality',
      desc: '',
      args: [],
    );
  }

  /// `Энергичность`
  String get energy {
    return Intl.message(
      'Энергичность',
      name: 'energy',
      desc: '',
      args: [],
    );
  }

  /// `Экстравагантность`
  String get extravagance {
    return Intl.message(
      'Экстравагантность',
      name: 'extravagance',
      desc: '',
      args: [],
    );
  }

  /// `Ваши данные записаны и сохранены в статистике.`
  String get safeData {
    return Intl.message(
      'Ваши данные записаны и сохранены в статистике.',
      name: 'safeData',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message(
      'Закрыть',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка: данные доступны после сохранения!`
  String get errorMessage {
    return Intl.message(
      'Ошибка: данные доступны после сохранения!',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Вы чувствуете {first} и {second}.`
  String answerYouFeel(Object first, Object second) {
    return Intl.message(
      'Вы чувствуете $first и $second.',
      name: 'answerYouFeel',
      desc: '',
      args: [first, second],
    );
  }

  /// `Ваш уровень стресса по шкале от 1 до 6 составляет {count}.`
  String answerStressLevel(Object count) {
    return Intl.message(
      'Ваш уровень стресса по шкале от 1 до 6 составляет $count.',
      name: 'answerStressLevel',
      desc: '',
      args: [count],
    );
  }

  /// `Ваш уровень самооценки по шкале от 1 до 6 составляет {count}.`
  String answerSelfAssessment(Object count) {
    return Intl.message(
      'Ваш уровень самооценки по шкале от 1 до 6 составляет $count.',
      name: 'answerSelfAssessment',
      desc: '',
      args: [count],
    );
  }

  /// `Ваша заметка: {notes}.`
  String answerNotes(Object notes) {
    return Intl.message(
      'Ваша заметка: $notes.',
      name: 'answerNotes',
      desc: '',
      args: [notes],
    );
  }

  /// `Январь`
  String get january {
    return Intl.message(
      'Январь',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `Февраль`
  String get february {
    return Intl.message(
      'Февраль',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `Март`
  String get march {
    return Intl.message(
      'Март',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `Апрель`
  String get april {
    return Intl.message(
      'Апрель',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `Май`
  String get may {
    return Intl.message(
      'Май',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `Июнь`
  String get june {
    return Intl.message(
      'Июнь',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `Июль`
  String get july {
    return Intl.message(
      'Июль',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `Август`
  String get august {
    return Intl.message(
      'Август',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `Сентябрь`
  String get september {
    return Intl.message(
      'Сентябрь',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `Октябрь`
  String get october {
    return Intl.message(
      'Октябрь',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `Ноябрь`
  String get november {
    return Intl.message(
      'Ноябрь',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `Декабрь`
  String get december {
    return Intl.message(
      'Декабрь',
      name: 'december',
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
