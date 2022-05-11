// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(data) => "flip Camera ${data}";

  static m1(data) => " ${data} المسابقات اليومية في";

  static m2(data) => "Flash: ${data}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "amount" : MessageLookupByLibrary.simpleMessage("amount:"),
    "beTheWinnerMessage" : MessageLookupByLibrary.simpleMessage("Be the Winner message"),
    "beTheWinnerTitle" : MessageLookupByLibrary.simpleMessage("Be the Winner title"),
    "cameraType" : m0,
    "cancel" : MessageLookupByLibrary.simpleMessage("cancel"),
    "chooseMall" : MessageLookupByLibrary.simpleMessage("choose mall"),
    "congratulationYourInvoiceAccepted" : MessageLookupByLibrary.simpleMessage("Congratulation, Your Invoice Accepted"),
    "dailyCompetitionTitle" : m1,
    "date" : MessageLookupByLibrary.simpleMessage("date:"),
    "email" : MessageLookupByLibrary.simpleMessage("email"),
    "enterEmail" : MessageLookupByLibrary.simpleMessage("please enter email"),
    "enterPassword" : MessageLookupByLibrary.simpleMessage("please enter password"),
    "flashStatus" : m2,
    "invoiceDetails" : MessageLookupByLibrary.simpleMessage("Invoice Details"),
    "letsCollect500Points" : MessageLookupByLibrary.simpleMessage("Lets Collect 500 Points"),
    "letsScanQr" : MessageLookupByLibrary.simpleMessage("Let\'s Scan QR"),
    "letsStartToScanAQrForYourBill" : MessageLookupByLibrary.simpleMessage("Let\'s Start to scan a Qr for your bill"),
    "loading" : MessageLookupByLibrary.simpleMessage("loading"),
    "login" : MessageLookupByLibrary.simpleMessage("login"),
    "malls" : MessageLookupByLibrary.simpleMessage("Malls"),
    "myCompetitions" : MessageLookupByLibrary.simpleMessage("My competitions"),
    "name" : MessageLookupByLibrary.simpleMessage("name:"),
    "noPermission" : MessageLookupByLibrary.simpleMessage("no Permission"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "password" : MessageLookupByLibrary.simpleMessage("password"),
    "pause" : MessageLookupByLibrary.simpleMessage("pause"),
    "resume" : MessageLookupByLibrary.simpleMessage("resume"),
    "riad" : MessageLookupByLibrary.simpleMessage("Riad"),
    "scanQr" : MessageLookupByLibrary.simpleMessage(" scan Qr "),
    "sorryWeCouldNotFindTheQr" : MessageLookupByLibrary.simpleMessage("Sorry, We could not find the QR"),
    "sorryYourInvoiceHasNotAccepted" : MessageLookupByLibrary.simpleMessage("Sorry, Your Invoice has not Accepted"),
    "startACompetition" : MessageLookupByLibrary.simpleMessage("Start A competition"),
    "taxAmount" : MessageLookupByLibrary.simpleMessage("tax amount:"),
    "taxNumber" : MessageLookupByLibrary.simpleMessage("tax number:"),
    "yourCity" : MessageLookupByLibrary.simpleMessage("your city:")
  };
}
