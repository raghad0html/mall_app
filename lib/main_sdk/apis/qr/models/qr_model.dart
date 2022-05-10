class QrModel {
  String? qrType;
  String? status;
  String? msg;
  String? invoiceAccepted;
  String? seller;
  double? taxNumber;
  DateTime? date;
  double? cost;
  int? vat;
  bool? stickerAccepted;
  int? points;
  int? balancePoints;

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
  });

  QrModel.fromJson(Map<String, dynamic> json) {
    qrType = json['qrType'];
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
    balancePoints = json['balancePoints'];
  }
}
