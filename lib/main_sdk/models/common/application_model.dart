// To parse this JSON data, do
//
//     final applicationModel = applicationModelFromMap(jsonString);

import 'dart:convert';

class ApplicationModel {
  ApplicationModel({
    this.where,
    this.include,
    this.order,
    this.method = "GET",
    this.applicationId = "Ps0quLVNgH",
    this.clientVersion = "js1.11.1",
    this.installationId = "d65d9190-9c7c-a4d4-455b-653c334b0d8c",
  });

  ApplicationModelWhere? where;
  String? include;
  String? order;
  String method;
  String applicationId = "Ps0quLVNgH";
  String clientVersion = "js1.11.1";
  String installationId = "d65d9190-9c7c-a4d4-455b-653c334b0d8c";

  Map<String, dynamic> toMap() => {
        "where": where?.toMap(),
        "include": include,
        "order": order,
        "_method": method,
        "_ApplicationId": applicationId,
        "_ClientVersion": clientVersion,
        "_InstallationId": installationId,
      }..removeWhere((key, value) => value == null);
}

class ApplicationModelWhere {
  ApplicationModelWhere({
    this.status = "Active",
    this.deletedAt = const DeletedAt(false),
    this.brand,
    this.category,
    this.name,
    this.salePrice,
    this.isFeatured
  });

  String status;
  DeletedAt deletedAt;
  Brand? brand;
  Category? category;
  Canonical? name;
  SalePrice? salePrice;
  bool? isFeatured;

  Map<String, dynamic> toMap() => {
        "status": status,
        "deletedAt": deletedAt.toMap(),
        "brand": brand?.toMap(),
        "category": category?.toMap(),
        "canonical": name?.toMap(),
        "salePrice": salePrice?.toMap(),
        "isFeatured": isFeatured
      }..removeWhere((key, value) => value == null);
}

class Brand {
  Brand({
    required this.inQuery,
  });

  InQuery inQuery;

  Map<String, dynamic> toMap() => {
        "\u0024inQuery": inQuery.toMap(),
      };
}

class Category {
  Category({
    this.type = "Pointer",
    this.className = "Category",
    required this.objectId,
  });

  String type;
  String className;
  String objectId;

  Map<String, dynamic> toMap() => {
        "__type": type,
        "className": className,
        "objectId": objectId,
      };
}

class Canonical {
  Canonical(
    this.regex,
  );

  String regex;

  Map<String, dynamic> toMap() => {
        "\u0024regex": "\\Q$regex\\E",
      };
}

class SalePrice {
  SalePrice({
    this.gt = 0,
  });

  int gt;

  Map<String, dynamic> toMap() => {
        "\u0024gt": gt,
      };
}

class InQuery {
  InQuery({
    required this.where ,
    required this.className,
  });

  InQueryWhere where;
  String className;

  Map<String, dynamic> toMap() => {
        "where": where.toMap(),
        "className": className,
      };
}

class InQueryWhere {
  const InQueryWhere({
    this.status = "Active",
    required this.objectId,
    this.deletedAt = const DeletedAt(false),
  });

  final String status;
  final  String objectId;
  final DeletedAt deletedAt;

  Map<String, dynamic> toMap() => {
        "status": status,
        "objectId": objectId,
        "deletedAt": deletedAt.toMap(),
      };
}

class DeletedAt {
  const DeletedAt(
    this.exists,
  );

  final bool exists;

  factory DeletedAt.fromJson(String str) => DeletedAt.fromMap(json.decode(str));

  factory DeletedAt.fromMap(Map<String, dynamic> json) => DeletedAt(
        json["\u0024exists"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024exists": exists,
      };
}
