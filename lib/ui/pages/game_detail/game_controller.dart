import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/game/models/game_action_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../../main_sdk/apis/game/models/game_params_model.dart';
import '../../../main_sdk/apis/game/services/game_identity_apis.dart';

class GameController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  bool loading = false;

  GameController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getGameDetails(int mallId, int gameId) async {
    GameParamsModel gameParamsModel = GameParamsModel(
      action: GameActionEnumsModel.getGameLevel,
      mallId: int.tryParse(LocalStorageService().lastMallId ?? '0') ?? 0,
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      gameId: gameId,
    );
    ResponseState<GameModel> _gameResponse =
        await GameIdentityApi().game(gameParamsModel: gameParamsModel);

    if (_gameResponse is SuccessState) {
      SuccessState<GameModel> data = _gameResponse as SuccessState<GameModel>;
      print(data.data.level);
    }
  }
}
