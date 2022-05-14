import 'package:flutter/material.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/product/models/product_model.dart';
import 'package:mall_app/main_sdk/apis/product/models/product_params_model.dart';
import 'package:mall_app/main_sdk/apis/product/services/product_identity_apis.dart';


import 'package:mvc_pattern/mvc_pattern.dart';

class ShopDetailsController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late List<ProductModel> products = [];
  bool loading = false;
  bool loadingCompetition = false;

  shopController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getProducts(String shopId) async {
    loading = true;
    setState(() {});
    Future<ResponseState<ListOfProductModel>> _listOfMallModel =
        ProductIdentityApi().getProduct(
            productParamsModel: ProductParamsModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      shopId: shopId,
    ));
    ResponseState<ListOfProductModel> data = await _listOfMallModel;
    if (data is SuccessState) {
      SuccessState<ListOfProductModel> d =
          data as SuccessState<ListOfProductModel>;
      products = d.data.data!;
      loading = false;
      setState(() {});
    }
  }
}
