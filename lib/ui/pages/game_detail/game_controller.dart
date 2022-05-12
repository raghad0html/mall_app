import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/game/models/game_action_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_level_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../../main_sdk/apis/game/models/game_params_model.dart';
import '../../../main_sdk/apis/game/services/game_identity_apis.dart';
import '../../helper/helper.dart';

class GameController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  int levelIndex = 0;
  bool zero = true;
  List<GameModel> games = [];
  bool loading = false;
  GameController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  getGameDetails(int mallId, int gameId, {bool init = false}) async {
    if (!init) {
      loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);
    }

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

      switch (data.data.level) {
        case GameLevelEnumsModel.zero:
          levelIndex = 0;
          zero = true;
          break;
        case GameLevelEnumsModel.dailyDone:
          levelIndex = 1;
          break;
        case GameLevelEnumsModel.dailyProgress:
          levelIndex = 0;
          zero = false;
          break;
        case GameLevelEnumsModel.weeklyDone:
          levelIndex = 2;
          break;
        case GameLevelEnumsModel.monthlyDone:
          levelIndex = 3;
          break;
        case GameLevelEnumsModel.quarterlyDone:
          levelIndex = 4;
          break;
        default:
          break;
      }
      if (!init) {
        Helper.hideLoader(loader);
      }
      setState(() {});
    }
  }

  getAllGames() async {
    loading = true;
    setState(() {});
    GameParamsModel gameParamsModel = GameParamsModel(
      action: GameActionEnumsModel.getGames,
      mallId: int.tryParse(LocalStorageService().lastMallId ?? '0') ?? 0,
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
    );
    ResponseState<GameModel> _gameResponse =
        await GameIdentityApi().game(gameParamsModel: gameParamsModel);

    if (_gameResponse is SuccessState) {
      SuccessState<GameModel> data = _gameResponse as SuccessState<GameModel>;
    } else if (_gameResponse is ErrorState) {
      ErrorState<GameModel> data = _gameResponse as ErrorState<GameModel>;
      print('DIMA DIMA ${data.errorMessage.error!.message}');
    }
    loading = false;
    setState(() {});
  }
}
