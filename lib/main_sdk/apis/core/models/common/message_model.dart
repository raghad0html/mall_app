import 'dart:convert';

class MessageModel {
  String message;
  bool? resetAccepted;
  bool? codeAccepted;

  MessageModel(
      {this.message = 'Unknown Error', this.resetAccepted, this.codeAccepted});

  factory MessageModel.fromJson(String str) =>
      MessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  // factory MessageModel.EmptyMessageSuccess() => MessageModel(isSuccess: true);

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        message: json['message'] ?? 'Unknown Error',
        resetAccepted: json['resetAccepted'],
        codeAccepted: json['codeAccepted'],
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'resetAccepted': resetAccepted,
        'codeAccepted': codeAccepted,
      };
}
