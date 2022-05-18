class ListOfShopModel {
  ListOfShopModel({
    this.data,
  });

  ListOfShopModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(ShopModel.fromJson(v));
      });
    }
  }

  List<ShopModel>? data;
}

class ShopModel {
  int? shopId;
  int? mallId;
  int? shopTaxNumber;
  String? shopName;
  String? shopEmail;
  int? shapPhone;
  int? shopPlan;
  int? shopQrScannedCount;
  int? point;
  String? code;
  String? timeCode;
  String? picture;
  double? shopAddressLat;
  double? shopAddressLon;
  String? shopAddress;

  ShopModel(
      {this.shopId,
      this.mallId,
      this.shopTaxNumber,
      this.shopName,
      this.shopEmail,
      this.shapPhone,
      this.shopPlan,
      this.shopQrScannedCount,
      this.point,
      this.code,
      this.timeCode,
      this.picture,
      this.shopAddress,
      this.shopAddressLat,
      this.shopAddressLon});

  ShopModel.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    mallId = json['mall_id'];
    shopTaxNumber = json['shop_taxNumber'];
    shopName = json['shop_name'];
    shopEmail = json['shop_email'];
    shapPhone = json['shap_phone'];
    shopPlan = json['shop_plan'];
    shopQrScannedCount = json['shop_qrScannedCount'];
    point = json['point'];
    code = json['code'];
    timeCode = json['time_code'];
    picture = json['picture'];
    shopAddress = json['shop_address'];
    shopAddressLat = json['shop_address_lat'];
    shopAddressLon = json['shop_address_lon'];
  }
}
