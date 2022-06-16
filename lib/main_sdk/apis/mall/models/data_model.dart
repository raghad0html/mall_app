class DataModel {
  String? billAmount;

  DataModel({
    this.billAmount,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    billAmount = json['bill_amount'] ?? '';
  }
}
