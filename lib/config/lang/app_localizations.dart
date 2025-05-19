import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'lang/app_localizations.dart';
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @notHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?  '**
  String get notHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'SignUp'**
  String get signUp;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  ///  Error message when the field is empty
  ///
  /// In en, this message translates to:
  /// **'{value} can not be empty'**
  String emty(String value);

  /// No description provided for @emailFormatText.
  ///
  /// In en, this message translates to:
  /// **'Email format is not correct'**
  String get emailFormatText;

  /// No description provided for @passwordFormatText.
  ///
  /// In en, this message translates to:
  /// **'Password must not be less than 6 digits'**
  String get passwordFormatText;

  /// No description provided for @loginText.
  ///
  /// In en, this message translates to:
  /// **'Let’s '**
  String get loginText;

  /// No description provided for @signInText.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInText;

  /// No description provided for @descriptionLoginText.
  ///
  /// In en, this message translates to:
  /// **'quis nostrud exercitation ullamco laboris nisi ut'**
  String get descriptionLoginText;

  /// No description provided for @createyourText.
  ///
  /// In en, this message translates to:
  /// **'Create your '**
  String get createyourText;

  /// No description provided for @createYourSellerText.
  ///
  /// In en, this message translates to:
  /// **'Create your Seller '**
  String get createYourSellerText;

  /// No description provided for @accountText.
  ///
  /// In en, this message translates to:
  /// **'account'**
  String get accountText;

  /// No description provided for @fullNameText.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullNameText;

  /// No description provided for @phoneNumberText.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberText;

  /// No description provided for @whatsAppText.
  ///
  /// In en, this message translates to:
  /// **'Whatsapp'**
  String get whatsAppText;

  /// No description provided for @nameFormatText.
  ///
  /// In en, this message translates to:
  /// **'Name format is not correct'**
  String get nameFormatText;

  /// No description provided for @phoneNumberFormatText.
  ///
  /// In en, this message translates to:
  /// **'Phone number format is not correct'**
  String get phoneNumberFormatText;

  /// No description provided for @whatsAppFormatText.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp format is not correct'**
  String get whatsAppFormatText;

  /// No description provided for @forgotPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordText;

  /// No description provided for @showPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Show Password'**
  String get showPasswordText;

  /// No description provided for @hidePasswordText.
  ///
  /// In en, this message translates to:
  /// **'Hide Password'**
  String get hidePasswordText;

  /// No description provided for @termsOfServiceText.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceText;

  /// No description provided for @endTextLoginText.
  ///
  /// In en, this message translates to:
  /// **'Continue without signing'**
  String get endTextLoginText;

  /// No description provided for @activeYourText.
  ///
  /// In en, this message translates to:
  /// **'Active your '**
  String get activeYourText;

  /// No description provided for @activeDescriptionText.
  ///
  /// In en, this message translates to:
  /// **'Please select a method for confirming your identity'**
  String get activeDescriptionText;

  /// No description provided for @emailText.
  ///
  /// In en, this message translates to:
  /// **'E mail'**
  String get emailText;

  /// No description provided for @smsCodeText.
  ///
  /// In en, this message translates to:
  /// **'Sms code'**
  String get smsCodeText;

  /// No description provided for @whatsappText.
  ///
  /// In en, this message translates to:
  /// **'Whatsapp code'**
  String get whatsappText;

  /// No description provided for @chooseMethodText.
  ///
  /// In en, this message translates to:
  /// **'Choose your method'**
  String get chooseMethodText;

  /// No description provided for @sendotpText.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendotpText;

  /// No description provided for @findText.
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get findText;

  /// No description provided for @forText.
  ///
  /// In en, this message translates to:
  /// **'for'**
  String get forText;

  /// No description provided for @bistPlaseText.
  ///
  /// In en, this message translates to:
  /// **' best place'**
  String get bistPlaseText;

  /// No description provided for @toStayInText.
  ///
  /// In en, this message translates to:
  /// **'to stay in '**
  String get toStayInText;

  /// No description provided for @goodPriceText.
  ///
  /// In en, this message translates to:
  /// **'good price'**
  String get goodPriceText;

  /// No description provided for @descriptionBordingViewsText.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed.'**
  String get descriptionBordingViewsText;

  /// No description provided for @nextText.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextText;

  /// No description provided for @fastBuyingYourPropertyText.
  ///
  /// In en, this message translates to:
  /// **'Fast buying your property'**
  String get fastBuyingYourPropertyText;

  /// No description provided for @inJustText.
  ///
  /// In en, this message translates to:
  /// **'in just '**
  String get inJustText;

  /// No description provided for @oneClickText.
  ///
  /// In en, this message translates to:
  /// **'one click'**
  String get oneClickText;

  /// No description provided for @perfectChoiceText.
  ///
  /// In en, this message translates to:
  /// **' perfect choice '**
  String get perfectChoiceText;

  /// No description provided for @yourFutureHouseText.
  ///
  /// In en, this message translates to:
  /// **'your future house'**
  String get yourFutureHouseText;

  /// No description provided for @showProfileText.
  ///
  /// In en, this message translates to:
  /// **'Show profile'**
  String get showProfileText;

  /// No description provided for @profileText.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileText;

  /// No description provided for @aboutUsText.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUsText;

  /// No description provided for @yourProductText.
  ///
  /// In en, this message translates to:
  /// **'Your product'**
  String get yourProductText;

  /// No description provided for @changeLanguageText.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguageText;

  /// No description provided for @changeCountryText.
  ///
  /// In en, this message translates to:
  /// **'Change country'**
  String get changeCountryText;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @favoriteText.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favoriteText;

  /// No description provided for @countryText.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryText;

  /// No description provided for @nameText.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameText;

  /// No description provided for @phoneText.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneText;

  /// No description provided for @paymentText.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentText;

  /// No description provided for @paymentDataText.
  ///
  /// In en, this message translates to:
  /// **'Payment data'**
  String get paymentDataText;

  /// No description provided for @payNowText.
  ///
  /// In en, this message translates to:
  /// **'Pay now'**
  String get payNowText;

  /// No description provided for @userText.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userText;

  /// No description provided for @sellerText.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get sellerText;

  /// No description provided for @didnotReceiveTheOTPText.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive the OTP? '**
  String get didnotReceiveTheOTPText;

  /// No description provided for @resendOTPText.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOTPText;

  /// No description provided for @descriptionEnterCodeText.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur.'**
  String get descriptionEnterCodeText;

  /// No description provided for @accountEnterCodeText.
  ///
  /// In en, this message translates to:
  /// **'Account '**
  String get accountEnterCodeText;

  /// No description provided for @successfullyText.
  ///
  /// In en, this message translates to:
  /// **'successfully'**
  String get successfullyText;

  /// No description provided for @createdText.
  ///
  /// In en, this message translates to:
  /// **'created'**
  String get createdText;

  /// No description provided for @finishText.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishText;

  /// No description provided for @enterTheText.
  ///
  /// In en, this message translates to:
  /// **'Enter the '**
  String get enterTheText;

  /// No description provided for @codeText.
  ///
  /// In en, this message translates to:
  /// **'code'**
  String get codeText;

  /// No description provided for @descriptionEnterViewText.
  ///
  /// In en, this message translates to:
  /// **'Enter the 4 digit code that we just sent to'**
  String get descriptionEnterViewText;

  /// No description provided for @facebookText.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebookText;

  /// No description provided for @profilePictureText.
  ///
  /// In en, this message translates to:
  /// **'Profile picture'**
  String get profilePictureText;

  /// No description provided for @documentsText.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documentsText;

  /// No description provided for @cityText.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityText;

  /// No description provided for @chooseAccountText.
  ///
  /// In en, this message translates to:
  /// **'You must choose the type of account.'**
  String get chooseAccountText;

  /// No description provided for @facebookFormatText.
  ///
  /// In en, this message translates to:
  /// **'Please! enter valied facebook url'**
  String get facebookFormatText;

  /// No description provided for @profilePictureFormatText.
  ///
  /// In en, this message translates to:
  /// **'Please! choose your profile picture'**
  String get profilePictureFormatText;

  /// No description provided for @documentsFormatText.
  ///
  /// In en, this message translates to:
  /// **'Please! enter your documents'**
  String get documentsFormatText;

  /// No description provided for @countryFormatText.
  ///
  /// In en, this message translates to:
  /// **'Please! enter your country'**
  String get countryFormatText;

  /// No description provided for @cityFormatText.
  ///
  /// In en, this message translates to:
  /// **'Please! enter your city'**
  String get cityFormatText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
