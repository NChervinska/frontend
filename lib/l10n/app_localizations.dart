
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('uk'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In uk, this message translates to:
  /// **'Готель для тварин'**
  String get appName;

  /// No description provided for @animals.
  ///
  /// In uk, this message translates to:
  /// **'Тварини'**
  String get animals;

  /// No description provided for @activities.
  ///
  /// In uk, this message translates to:
  /// **'Активність'**
  String get activities;

  /// No description provided for @employees.
  ///
  /// In uk, this message translates to:
  /// **'Працівники'**
  String get employees;

  /// No description provided for @clients.
  ///
  /// In uk, this message translates to:
  /// **'Клієнти'**
  String get clients;

  /// No description provided for @users.
  ///
  /// In uk, this message translates to:
  /// **'Користувачі'**
  String get users;

  /// No description provided for @ukrainian.
  ///
  /// In uk, this message translates to:
  /// **'Ураїнська'**
  String get ukrainian;

  /// No description provided for @english.
  ///
  /// In uk, this message translates to:
  /// **'Анлійська'**
  String get english;

  /// No description provided for @name.
  ///
  /// In uk, this message translates to:
  /// **'Ім\'я'**
  String get name;

  /// No description provided for @type.
  ///
  /// In uk, this message translates to:
  /// **'Вид'**
  String get type;

  /// No description provided for @weight.
  ///
  /// In uk, this message translates to:
  /// **'Вага'**
  String get weight;

  /// No description provided for @age.
  ///
  /// In uk, this message translates to:
  /// **'Вік'**
  String get age;

  /// No description provided for @employee.
  ///
  /// In uk, this message translates to:
  /// **'Працівник'**
  String get employee;

  /// No description provided for @client.
  ///
  /// In uk, this message translates to:
  /// **'Клієнт'**
  String get client;

  /// No description provided for @editAnimal.
  ///
  /// In uk, this message translates to:
  /// **'Редагування тварини'**
  String get editAnimal;

  /// No description provided for @createAnimal.
  ///
  /// In uk, this message translates to:
  /// **'Створення тварини'**
  String get createAnimal;

  /// No description provided for @editEmployee.
  ///
  /// In uk, this message translates to:
  /// **'Редагування працівника'**
  String get editEmployee;

  /// No description provided for @createEmployee.
  ///
  /// In uk, this message translates to:
  /// **'Створення працівника'**
  String get createEmployee;

  /// No description provided for @surname.
  ///
  /// In uk, this message translates to:
  /// **'Прізвище'**
  String get surname;

  /// No description provided for @password.
  ///
  /// In uk, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @phone.
  ///
  /// In uk, this message translates to:
  /// **'Телефон'**
  String get phone;

  /// No description provided for @sleepHours.
  ///
  /// In uk, this message translates to:
  /// **'Часи сну'**
  String get sleepHours;

  /// No description provided for @activeHours.
  ///
  /// In uk, this message translates to:
  /// **'Активні часи'**
  String get activeHours;

  /// No description provided for @editActivity.
  ///
  /// In uk, this message translates to:
  /// **'Редагувати активність'**
  String get editActivity;

  /// No description provided for @createActivity.
  ///
  /// In uk, this message translates to:
  /// **'Створити активність'**
  String get createActivity;

  /// No description provided for @date.
  ///
  /// In uk, this message translates to:
  /// **'Дата'**
  String get date;

  /// No description provided for @checkAllAnimal.
  ///
  /// In uk, this message translates to:
  /// **'Перевірити усіх тварин'**
  String get checkAllAnimal;

  /// No description provided for @allAnimalsAreHealthy.
  ///
  /// In uk, this message translates to:
  /// **'Усі тварини здорові'**
  String get allAnimalsAreHealthy;

  /// No description provided for @login.
  ///
  /// In uk, this message translates to:
  /// **'Увійти'**
  String get login;

  /// No description provided for @error.
  ///
  /// In uk, this message translates to:
  /// **'Помилка'**
  String get error;

  /// No description provided for @email.
  ///
  /// In uk, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @bonus.
  ///
  /// In uk, this message translates to:
  /// **'Бонуси'**
  String get bonus;

  /// No description provided for @cat.
  ///
  /// In uk, this message translates to:
  /// **'Котк'**
  String get cat;

  /// No description provided for @dog.
  ///
  /// In uk, this message translates to:
  /// **'Собачка'**
  String get dog;

  /// No description provided for @parrot.
  ///
  /// In uk, this message translates to:
  /// **'Папугайчик'**
  String get parrot;

  /// No description provided for @humster.
  ///
  /// In uk, this message translates to:
  /// **'Хом\'ячок'**
  String get humster;

  /// No description provided for @turtle.
  ///
  /// In uk, this message translates to:
  /// **'Черепашка'**
  String get turtle;

  /// No description provided for @register.
  ///
  /// In uk, this message translates to:
  /// **'Зареєструвати'**
  String get register;

  /// No description provided for @settings.
  ///
  /// In uk, this message translates to:
  /// **'Налаштування'**
  String get settings;

  /// No description provided for @editProfile.
  ///
  /// In uk, this message translates to:
  /// **'Змінити профіль'**
  String get editProfile;

  /// No description provided for @backup.
  ///
  /// In uk, this message translates to:
  /// **'Резервна копія'**
  String get backup;

  /// No description provided for @restore.
  ///
  /// In uk, this message translates to:
  /// **'Відновити'**
  String get restore;

  /// No description provided for @changePassword.
  ///
  /// In uk, this message translates to:
  /// **'Змінити пароль'**
  String get changePassword;

  /// No description provided for @oldPassword.
  ///
  /// In uk, this message translates to:
  /// **'Старий пароль'**
  String get oldPassword;

  /// No description provided for @newPassword.
  ///
  /// In uk, this message translates to:
  /// **'Новий пароль'**
  String get newPassword;

  /// No description provided for @logout.
  ///
  /// In uk, this message translates to:
  /// **'Вийти'**
  String get logout;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'uk': return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
