class ListOfGiftModel {
  ListOfGiftModel({
    this.data,
  });

  ListOfGiftModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(GiftModel.fromJson(v));
      });
    }
  }

  List<GiftModel>? data;
}

class GiftModel {
  int? giftId;
  String? giftName;
  String? giftPicture;
  String? giftDescription;
  int? giftTo;
  String? giftBy;
  int? giftMall;
  int? giftReceived;
  DateTime? giftDateAdded;
  String? mallName;
  String? giftByName;
  String? giftReceiverName;

  GiftModel(
      {this.giftId,
      this.giftName,
      this.giftDescription,
      this.giftTo,
      this.giftBy,
      this.giftMall,
      this.giftReceived,
      this.giftDateAdded,
      this.mallName,
      this.giftByName,
      this.giftReceiverName,
      this.giftPicture,
      });

  GiftModel.fromJson(Map<String, dynamic> json) {
    giftId = json['gift_id'];
    giftName = json['gift_name'];
    giftDescription = json['gift_description'];
    giftTo = json['gift_to'];
    giftBy = json['gift_by'].toString();
    giftMall = json['gift_mall'];
    giftReceived = json['gift_received'];
    giftPicture = json['gift_picture'];
    giftDateAdded = json['date'] != null
        ? DateTime.parse(json['gift_dateAdded'] as String)
        : null;
    mallName = json['mall_name'];
    giftByName = json['gift_byName'];
    giftReceiverName = json['gift_receiverName'];
  }
}
