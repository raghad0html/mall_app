class ListOfProductModel {
  ListOfProductModel({
    this.data,
  });

  ListOfProductModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(ProductModel.fromJson(v));
      });
    }
  }

  List<ProductModel>? data;
}

class ProductModel {
  int? prodId;
  int? shopId;
  String? name;
  int? price;
  String? picture;
  int? stock;
  String? dateAdd;

  ProductModel(
      {this.prodId,
      this.shopId,
      this.name,
      this.price,
      this.picture,
      this.stock,
      this.dateAdd});

  ProductModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    shopId = json['shop_id'];
    name = json['name'];
    price = json['price'];
    picture = json['picture'];
    stock = json['stock'];
    dateAdd = json['dateAdd'];
  }
}
