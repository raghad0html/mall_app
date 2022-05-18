import 'package:flutter/material.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/shop/models/shop_model.dart';
import 'package:mall_app/main_sdk/apis/shop/models/shop_params_model.dart';
import 'package:mall_app/main_sdk/apis/shop/services/shop_identity_apis.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

class ShopController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late List<ShopModel> shops = [];
  bool loading = false;
  bool loadingCompetition = false;

  shopController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getShops(String mallId) async {
    loading = true;
    setState(() {});
    Future<ResponseState<ListOfShopModel>> _listOfMallModel =
        ShopIdentityApi().getShops(
            shopParamsModel: ShopParamsModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      mallId: mallId,
    ));
    ResponseState<ListOfShopModel> data = await _listOfMallModel;
    if (data is SuccessState) {
      SuccessState<ListOfShopModel> d = data as SuccessState<ListOfShopModel>;
      shops = d.data.data!;
      loading = false;
      setState(() {});
    }
  }
}
