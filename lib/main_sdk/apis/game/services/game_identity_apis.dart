import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/game/models/all_game_params_model.dart';
import 'package:mall_app/main_sdk/apis/game/models/game_model.dart';
import 'package:mall_app/main_sdk/apis/game/models/game_params_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class GameIdentityApi extends ApiModelIdentity {
  Future<ResponseState<GameModel>> game(
      {required GameParamsModel gameParamsModel}) async {
    return apiMethod('game.php',
        data: gameParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => GameModel.fromJson(json));
  }

  Future<ResponseState<ListOfGameModel>> getAllGame(
      {required AllGameParamsModel allGameParamsModel}) async {
    return apiMethod('game.php',
        data: allGameParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfGameModel.fromJson(json));
  }
}
