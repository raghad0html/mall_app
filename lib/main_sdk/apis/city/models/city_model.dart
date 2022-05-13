class ListOfCityModel {
  ListOfCityModel({
    this.data,
  });

  ListOfCityModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(CityModel.fromJson(v));
      });
    }
  }

  List<CityModel>? data;
}

class CityModel {
  int? cityId;
  String? cityName;

  CityModel({this.cityId, this.cityName});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'] ?? 0;
    cityName = json['city_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    return data;
  }
}
