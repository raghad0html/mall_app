import 'dart:convert';

class MessageModel {
  String message;
  bool? resetAccepted;
  bool? codeAccepted;
  bool? registerAccepted;
  bool? resendAccepted;
  bool? newPasswordAccepted;
  bool? giftAccepted;
  bool? updateProfileAccepted;
  String? msg;

  MessageModel(
      {this.message = 'Unknown Error',
      this.resetAccepted,
      this.codeAccepted,
      this.registerAccepted,
      this.resendAccepted,
      this.msg,
      this.updateProfileAccepted,
      this.giftAccepted,
      this.newPasswordAccepted});

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel.fromMap(json);

  String toJson() => json.encode(toMap());

  // factory MessageModel.EmptyMessageSuccess() => MessageModel(isSuccess: true);

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        message: json['message'] ?? 'Unknown Error',
        resetAccepted: json['resetAccepted'],
        codeAccepted: json['codeAccepted'],
        registerAccepted: json['registerAccepted'],
        resendAccepted: json['resendAccepted'],
        newPasswordAccepted: json['newPasswordAccepted'],
        updateProfileAccepted: json['updateProfileAccepted'],
        giftAccepted: json['giftAccepted'],
        msg: json['msg'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'resetAccepted': resetAccepted,
        'codeAccepted': codeAccepted,
        'registerAccepted': registerAccepted,
        'resendAccepted': resendAccepted,
        'newPasswordAccepted': newPasswordAccepted,
        'giftAccepted': giftAccepted,
        'msg': msg,
      };
}
