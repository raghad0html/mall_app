import 'dart:convert';

class MessageModel {
  String message;
  bool? resetAccepted;
  bool? codeAccepted;
  bool? registerAccepted;
  bool? resendAccepted;
  bool? newPasswordAccepted;

  MessageModel(
      {this.message = 'Unknown Error',
      this.resetAccepted,
      this.codeAccepted,
      this.registerAccepted,
      this.resendAccepted,
      this.newPasswordAccepted});

  factory MessageModel.fromJson(String str) =>
      MessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  // factory MessageModel.EmptyMessageSuccess() => MessageModel(isSuccess: true);

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        message: json['message'] ?? 'Unknown Error',
        resetAccepted: json['resetAccepted'],
        codeAccepted: json['codeAccepted'],
        registerAccepted: json['registerAccepted'],
        resendAccepted: json['resendAccepted'],
        newPasswordAccepted: json['newPasswordAccepted'],
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'resetAccepted': resetAccepted,
        'codeAccepted': codeAccepted,
        'registerAccepted': registerAccepted,
        'resendAccepted': resendAccepted,
        'newPasswordAccepted': newPasswordAccepted,
      };
}
