import 'package:mall_app/main_sdk/apis/qr/models/qr_type_enums_model.dart';

class QrModel {
  QrTypeParamsModel? qrType;
  String? status;
  String? msg;
  bool? invoiceAccepted;
  String? seller;
  int? taxNumber;
  DateTime? date;
  double? cost;
  double? vat;
  bool? stickerAccepted;
  int? points;
  int? balancePoints;
  int? targetPoints;
  String? mallName;

  QrModel({
    this.qrType,
    this.status,
    this.msg,
    this.invoiceAccepted,
    this.seller,
    this.taxNumber,
    this.date,
    this.cost,
    this.vat,
    this.stickerAccepted,
    this.points,
    this.balancePoints,
    this.targetPoints,
    this.mallName,
  });

  QrModel.fromJson(Map<String, dynamic> json) {
    qrType = qrType?.fromStringToQrTypeParamsModel(json['qrType']);
    status = json['status'];
    msg = json['msg'];
    invoiceAccepted = json['invoiceAccepted'];
    seller = json['seller'];
    taxNumber = json['taxNumber'];
    date = json['date'] != null ? DateTime.parse(json['date'] as String) : null;
    cost = json['cost'];
    vat = json['vat'];
    stickerAccepted = json['stickerAccepted'];
    points = json['points'];
    targetPoints = json['target_points'];
    balancePoints = json['balance_points'];
    mallName = json['mall_name'];
  }
}
