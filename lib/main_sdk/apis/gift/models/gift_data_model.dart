class GiftDataModel {
  int? giftQuantity;

  GiftDataModel({
    this.giftQuantity,
  });

  GiftDataModel.fromJson(Map<String, dynamic> json) {
    giftQuantity = json['giftQuantity'] ;
  }
}
