import 'package:flutter/material.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/gift/models/get_gift_by_shop_params_model.dart';
import 'package:mall_app/main_sdk/apis/gift/models/gift_model.dart';
import 'package:mall_app/main_sdk/apis/gift/services/gift_identity_apis.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class GiftsController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late List<GiftModel> gifts = [];
  bool loading = false;

  GiftsController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getGifts(String shopId) async {
    loading = true;
    setState(() {});
    Future<ResponseState<ListOfGiftModel>> _listOfMallModel =
        GiftIdentityApi().getGiftsByShop(
            getGiftByShopParamsModel: GetGiftByShopParamsModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      action: 'getGiftsByShop',
      shopId: shopId,
    ));
    ResponseState<ListOfGiftModel> data = await _listOfMallModel;
    if (data is SuccessState) {
      SuccessState<ListOfGiftModel> d = data as SuccessState<ListOfGiftModel>;
      gifts = d.data.data!;
      loading = false;
      setState(() {});
    }
    if (data is ErrorState) {
      ErrorState<ListOfGiftModel> d = data as ErrorState<ListOfGiftModel>;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(d.errorMessage.error!.message),
      ));
    }
  }
}
