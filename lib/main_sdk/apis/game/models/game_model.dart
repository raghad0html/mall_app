import 'package:mall_app/main_sdk/apis/game/models/game_level_enums_model.dart';

class GameModel {
  bool? gameAccepted;
  String? msg;
  int? gameId;
  GameLevelEnumsModel? level;

  GameModel({this.gameAccepted, this.msg, this.gameId, this.level});

  GameModel.fromJson(Map<String, dynamic> json) {
    gameAccepted = json['gameAccepted'];
    msg = json['msg'];
    gameId = json['game_id'];
    level = level?.fromStringToGameLevelEnumsModel(json['level']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameAccepted'] = gameAccepted;
    data['msg'] = msg;
    data['game_id'] = gameId;
    data['level'] = level;
    return data;
  }
}
