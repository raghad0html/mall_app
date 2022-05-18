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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
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

  /// `Flash: {data}`
  String flashStatus(Object data) {
    return Intl.message(
      'Flash: $data',
      name: 'flashStatus',
      desc: '',
      args: [data],
    );
  }

  /// `flip Camera {data}`
  String cameraType(Object data) {
    return Intl.message(
      'flip Camera $data',
      name: 'cameraType',
      desc: '',
      args: [data],
    );
  }

  /// `pause`
  String get pause {
    return Intl.message(
      'pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `resume`
  String get resume {
    return Intl.message(
      'resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Let's Scan QR`
  String get letsScanQr {
    return Intl.message(
      'Let\'s Scan QR',
      name: 'letsScanQr',
      desc: '',
      args: [],
    );
  }

  /// `no Permission`
  String get noPermission {
    return Intl.message(
      'no Permission',
      name: 'noPermission',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start to scan a Qr for your bill`
  String get letsStartToScanAQrForYourBill {
    return Intl.message(
      'Let\'s Start to scan a Qr for your bill',
      name: 'letsStartToScanAQrForYourBill',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, We could not find the QR`
  String get sorryWeCouldNotFindTheQr {
    return Intl.message(
      'Sorry, We could not find the QR',
      name: 'sorryWeCouldNotFindTheQr',
      desc: '',
      args: [],
    );
  }

  /// `Lets Collect 500 Points`
  String get letsCollect500Points {
    return Intl.message(
      'Lets Collect 500 Points',
      name: 'letsCollect500Points',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation, Your Invoice Accepted`
  String get congratulationYourInvoiceAccepted {
    return Intl.message(
      'Congratulation, Your Invoice Accepted',
      name: 'congratulationYourInvoiceAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Your Invoice has not Accepted`
  String get sorryYourInvoiceHasNotAccepted {
    return Intl.message(
      'Sorry, Your Invoice has not Accepted',
      name: 'sorryYourInvoiceHasNotAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Details`
  String get invoiceDetails {
    return Intl.message(
      'Invoice Details',
      name: 'invoiceDetails',
      desc: '',
      args: [],
    );
  }

  /// `name:`
  String get name {
    return Intl.message(
      'name:',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `tax number:`
  String get taxNumber {
    return Intl.message(
      'tax number:',
      name: 'taxNumber',
      desc: '',
      args: [],
    );
  }

  /// `date:`
  String get date {
    return Intl.message(
      'date:',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `amount:`
  String get amount {
    return Intl.message(
      'amount:',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `tax amount:`
  String get taxAmount {
    return Intl.message(
      'tax amount:',
      name: 'taxAmount',
      desc: '',
      args: [],
    );
  }

  /// ` scan Qr `
  String get scanQr {
    return Intl.message(
      ' scan Qr ',
      name: 'scanQr',
      desc: '',
      args: [],
    );
  }

  /// ` {data} المسابقات اليومية في`
  String dailyCompetitionTitle(Object data) {
    return Intl.message(
      ' $data المسابقات اليومية في',
      name: 'dailyCompetitionTitle',
      desc: '',
      args: [data],
    );
  }

  /// `اختر المرحلة المتاحة لاستكمال المسابقة`
  String get chooseLevelToContinueTheCompetition {
    return Intl.message(
      'اختر المرحلة المتاحة لاستكمال المسابقة',
      name: 'chooseLevelToContinueTheCompetition',
      desc: '',
      args: [],
    );
  }

  /// `يومي`
  String get daily {
    return Intl.message(
      'يومي',
      name: 'daily',
      desc: '',
      args: [],
    );
  }

  /// `مسابقة اسبوعية`
  String get weeklyCompetition {
    return Intl.message(
      'مسابقة اسبوعية',
      name: 'weeklyCompetition',
      desc: '',
      args: [],
    );
  }

  /// `أسبوعي`
  String get weekly {
    return Intl.message(
      'أسبوعي',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `مسابقة شهرية`
  String get monthlyCompetition {
    return Intl.message(
      'مسابقة شهرية',
      name: 'monthlyCompetition',
      desc: '',
      args: [],
    );
  }

  /// `شهري`
  String get monthly {
    return Intl.message(
      'شهري',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `مسابقة ربع سنوية`
  String get QuarterManualCompetition {
    return Intl.message(
      'مسابقة ربع سنوية',
      name: 'QuarterManualCompetition',
      desc: '',
      args: [],
    );
  }

  /// `ربع سنوي`
  String get QuarterManual {
    return Intl.message(
      'ربع سنوي',
      name: 'QuarterManual',
      desc: '',
      args: [],
    );
  }

  /// `--`
  String get dash {
    return Intl.message(
      '--',
      name: 'dash',
      desc: '',
      args: [],
    );
  }

  /// `اشتر فاتورة من أحد المحلات المشتركة معنا\n بقيمة 300 ريال على الأقل  \n ثم امسح باركود QR الخاص بها`
  String get invoiceDescription {
    return Intl.message(
      'اشتر فاتورة من أحد المحلات المشتركة معنا\n بقيمة 300 ريال على الأقل  \n ثم امسح باركود QR الخاص بها',
      name: 'invoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `عرض المحلات المشتركة`
  String get browseSubscriptionMarkets {
    return Intl.message(
      'عرض المحلات المشتركة',
      name: 'browseSubscriptionMarkets',
      desc: '',
      args: [],
    );
  }

  /// `مسح باركود فاتورة`
  String get scanInvoiceBarcode {
    return Intl.message(
      'مسح باركود فاتورة',
      name: 'scanInvoiceBarcode',
      desc: '',
      args: [],
    );
  }

  /// `اعادة المحاولة`
  String get retry {
    return Intl.message(
      'اعادة المحاولة',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `اختر مدينتك الحالية`
  String get chooseCurrentCity {
    return Intl.message(
      'اختر مدينتك الحالية',
      name: 'chooseCurrentCity',
      desc: '',
      args: [],
    );
  }

  /// `قم بتوجيه الكاميرا على باركود الفاتورة`
  String get howToScanBarcode {
    return Intl.message(
      'قم بتوجيه الكاميرا على باركود الفاتورة',
      name: 'howToScanBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Create new Account`
  String get createNewAccount {
    return Intl.message(
      'Create new Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `كلمتا السر غير متطابقتين`
  String get passwordMismatch {
    return Intl.message(
      'كلمتا السر غير متطابقتين',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `أعد كتابة كلمة المرور`
  String get rewritePassword {
    return Intl.message(
      'أعد كتابة كلمة المرور',
      name: 'rewritePassword',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get username {
    return Intl.message(
      'UserName',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter User Name`
  String get enterUserName {
    return Intl.message(
      'Enter User Name',
      name: 'enterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `I have an account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have an account',
      name: 'iHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `forget password`
  String get forgetPassword {
    return Intl.message(
      'forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `create new password`
  String get createNewPassword {
    return Intl.message(
      'create new password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `tapAgainToLeave`
  String get tapagaintoleave {
    return Intl.message(
      'tapAgainToLeave',
      name: 'tapagaintoleave',
      desc: '',
      args: [],
    );
  }

  /// `تهانينا`
  String get congradulatins {
    return Intl.message(
      'تهانينا',
      name: 'congradulatins',
      desc: '',
      args: [],
    );
  }

  /// `حول`
  String get about {
    return Intl.message(
      'حول',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `السادة: وفقهم الله`
  String get mr_s {
    return Intl.message(
      'السادة: وفقهم الله',
      name: 'mr_s',
      desc: '',
      args: [],
    );
  }

  /// `الجوائز`
  String get gifts {
    return Intl.message(
      'الجوائز',
      name: 'gifts',
      desc: '',
      args: [],
    );
  }

  /// `مسابقات جارية`
  String get currentCpmpetitions {
    return Intl.message(
      'مسابقات جارية',
      name: 'currentCpmpetitions',
      desc: '',
      args: [],
    );
  }

  /// `مسابقات منتهية`
  String get endedCompetitions {
    return Intl.message(
      'مسابقات منتهية',
      name: 'endedCompetitions',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد مسابقات جارية`
  String get noCurrentCompetitions {
    return Intl.message(
      'لا يوجد مسابقات جارية',
      name: 'noCurrentCompetitions',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد مسابقات منتهية`
  String get noEndedCompetitions {
    return Intl.message(
      'لا يوجد مسابقات منتهية',
      name: 'noEndedCompetitions',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get showAll {
    return Intl.message(
      'عرض الكل',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد مولات لعرضها`
  String get noMalls {
    return Intl.message(
      'لا يوجد مولات لعرضها',
      name: 'noMalls',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد محلات لعرضها`
  String get noShop {
    return Intl.message(
      'لا يوجد محلات لعرضها',
      name: 'noShop',
      desc: '',
      args: [],
    );
  }

  /// `مجموعة الجوائز المقدمة`
  String get giftsGiven {
    return Intl.message(
      'مجموعة الجوائز المقدمة',
      name: 'giftsGiven',
      desc: '',
      args: [],
    );
  }

  /// `منتجاتنا`
  String get ourProducts {
    return Intl.message(
      'منتجاتنا',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `العودة لمراحل المسابقة`
  String get backTopreviousLevel {
    return Intl.message(
      'العودة لمراحل المسابقة',
      name: 'backTopreviousLevel',
      desc: '',
      args: [],
    );
  }

  /// `لإنهاء المسابقة اليومية \n عليك التوجه للمحلات المشاركة \n ومسح لصاقة باركود QR لكسب النقاط والفوز`
  String get nNQrTowin {
    return Intl.message(
      'لإنهاء المسابقة اليومية \n عليك التوجه للمحلات المشاركة \n ومسح لصاقة باركود QR لكسب النقاط والفوز',
      name: 'nNQrTowin',
      desc: '',
      args: [],
    );
  }

  /// `رصيد نقاطك الحالي`
  String get yourPoints {
    return Intl.message(
      'رصيد نقاطك الحالي',
      name: 'yourPoints',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكنك مسح فاتورة تأكد من عدد نقاطك`
  String get youCantscanQr {
    return Intl.message(
      'لا يمكنك مسح فاتورة تأكد من عدد نقاطك',
      name: 'youCantscanQr',
      desc: '',
      args: [],
    );
  }

  /// `مسح باركود محل`
  String get scanQrforShop {
    return Intl.message(
      'مسح باركود محل',
      name: 'scanQrforShop',
      desc: '',
      args: [],
    );
  }

  /// `إعادة تعيين كلمة المرور`
  String get resetPassword {
    return Intl.message(
      'إعادة تعيين كلمة المرور',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال كود التأكيد على بريدك الالكتروني`
  String get verCodeHasSentToYourEmail {
    return Intl.message(
      'تم إرسال كود التأكيد على بريدك الالكتروني',
      name: 'verCodeHasSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `كود التأكيد`
  String get verificationCode {
    return Intl.message(
      'كود التأكيد',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `يرجى ادخال كود التأكيد`
  String get pleaseAddVerificationCode {
    return Intl.message(
      'يرجى ادخال كود التأكيد',
      name: 'pleaseAddVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد رمز التأكيد`
  String get beSureFromVerificationCode {
    return Intl.message(
      'تأكيد رمز التأكيد',
      name: 'beSureFromVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `لم يصلك الرمز`
  String get havetGotTheCode {
    return Intl.message(
      'لم يصلك الرمز',
      name: 'havetGotTheCode',
      desc: '',
      args: [],
    );
  }

  /// `إعادة إرسال الرمز`
  String get resendCode {
    return Intl.message(
      'إعادة إرسال الرمز',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `انتباه`
  String get attention {
    return Intl.message(
      'انتباه',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد تسجيل الخروج؟`
  String get doyouWantToLogout {
    return Intl.message(
      'هل تريد تسجيل الخروج؟',
      name: 'doyouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message(
      'نعم',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get userProfile {
    return Intl.message(
      'الملف الشخصي',
      name: 'userProfile',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get phoneNumber {
    return Intl.message(
      'رقم الهاتف',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `يرجى ادخال رقم الهاتف`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'يرجى ادخال رقم الهاتف',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصي`
  String get editProfile {
    return Intl.message(
      'تعديل الملف الشخصي',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get fullName {
    return Intl.message(
      'الاسم الكامل',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `حسابي`
  String get myAccount {
    return Intl.message(
      'حسابي',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `مقروء`
  String get readed {
    return Intl.message(
      'مقروء',
      name: 'readed',
      desc: '',
      args: [],
    );
  }

  /// `غير مقروء`
  String get notReaded {
    return Intl.message(
      'غير مقروء',
      name: 'notReaded',
      desc: '',
      args: [],
    );
  }

  /// `الاشعارات`
  String get notifications {
    return Intl.message(
      'الاشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لنقم بجمع نقاط`
  String get letUsCollectPoints {
    return Intl.message(
      'لنقم بجمع نقاط',
      name: 'letUsCollectPoints',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
