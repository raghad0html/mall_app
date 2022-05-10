class ListOfMallModel {
  ListOfMallModel({
    this.data,
  });

  ListOfMallModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(MallModel.fromJson(v));
      });
    }
  }

  List<MallModel>? data;
}

class MallModel {
  late String mallId;
  String? cityId;
  String? name;
  String? icon;
  String? linkApp;

  MallModel(
      {required this.mallId, this.cityId, this.name, this.icon, this.linkApp});

  MallModel.fromJson(Map<String, dynamic> json) {
    mallId = json['mall_id'];
    cityId = json['city_id'];
    name = json['name'];
    icon = json['icon'];
    linkApp = json['link_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mall_id'] = mallId;
    data['city_id'] = cityId;
    data['name'] = name;
    data['icon'] = icon;
    data['link_app'] = linkApp;
    return data;
  }
}
