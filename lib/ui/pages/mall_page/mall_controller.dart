import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';

import '../../../main_sdk/apis/mall/models/mall_action_enums_model.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';
import '../../../main_sdk/apis/mall/models/mall_params_model.dart';
import '../../../main_sdk/apis/mall/services/mall_identity_apis.dart';

class MallController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late List<MallModel> malls = [];
  bool loading = false;
  bool loadingCompetition = false;

  mallController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getMalls(int city) async {
    loading = true;
    setState(() {});
    Future<ResponseState<ListOfMallModel>> _listOfMallModel = MallIdentityApi()
        .getMalls(
        mallParamsModel: MallParamsModel(
            token: LocalStorageService().token ?? '',
            userid: LocalStorageService().id ?? '',
            action: MallActionEnumsModel.getMallsByCity,
            cityId: city.toString()));
    ResponseState<ListOfMallModel> data = await _listOfMallModel;
    if (data is SuccessState) {
      SuccessState<ListOfMallModel> d = data as SuccessState<ListOfMallModel>;
      malls = d.data.data!;
      loading = false;
      setState(() {});
    }
  }
}
