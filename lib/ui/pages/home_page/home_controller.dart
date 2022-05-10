import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/game/services/game_identity_apis.dart';
import 'package:mall_app/routes.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/game/models/game_action_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../../main_sdk/apis/game/models/game_params_model.dart';
import '../../../main_sdk/apis/mall/models/mall_action_enums_model.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';
import '../../../main_sdk/apis/mall/models/mall_params_model.dart';
import '../../../main_sdk/apis/mall/services/mall_identity_apis.dart';
import '../../helper/helper.dart';

class HomeController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late List<MallModel> malls = [];
  bool loading = false;

  HomeController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getMalls() async {
    loading = true;
    setState(() {});
    Future<ResponseState<ListOfMallModel>> _listOfMallModel = MallIdentityApi()
        .getMalls(
            mallParamsModel: MallParamsModel(
                token: LocalStorageService().token ?? '',
                userid: LocalStorageService().id ?? '',
                action: MallActionEnumsModel.getMallsByCity,
                cityId: '1'));
    ResponseState<ListOfMallModel> data = await _listOfMallModel;
    if (data is SuccessState) {
      SuccessState<ListOfMallModel> d = data as SuccessState<ListOfMallModel>;
      malls = d.data.data!;
      loading = false;
      setState(() {});
    }
  }

  createGame(int mallId) async {
    var loader = Helper.overlayLoader(state!.context);
    FocusScope.of(state!.context).unfocus();
    Helper.overlayLoader(state!.context);
    Overlay.of(state!.context)?.insert(loader);

    GameParamsModel gameParamsModel = GameParamsModel(
      action: GameActionEnumsModel.createGame,
      mallId: mallId,
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
    );
    ResponseState<GameModel> _gameResponse =
        await GameIdentityApi().game(gameParamsModel: gameParamsModel);
    Helper.hideLoader(loader); //
    Navigator.pushNamed(state!.context, Routes.gameDetailScreen); //
    LocalStorageService().lastMallId = mallId.toString(); //
    if (_gameResponse is SuccessState) {
      GameModel gameModel = _gameResponse as GameModel;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(gameModel.msg ?? ''),
      ));
      LocalStorageService().lastGameId = gameModel.gameId.toString();
      LocalStorageService().lastMallId = mallId.toString();

      Helper.hideLoader(loader);
      Navigator.pushNamed(state!.context, Routes.gameDetailScreen);
    }
    if (_gameResponse is ErrorState) {
      GameModel gameModel = _gameResponse as GameModel;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(gameModel.msg ?? ''),
      ));
      LocalStorageService().lastGameId = gameModel.gameId.toString();
      Helper.hideLoader(loader);
      Navigator.pushNamed(state!.context, Routes.gameDetailScreen);
      LocalStorageService().lastMallId = mallId.toString();
    }
  }
}
