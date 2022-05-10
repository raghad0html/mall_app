import 'package:mall_app/main_sdk/apis/game/models/game_level_enums_model.dart';

class GameModel {
  bool? gameAccepted;
  String? msg;
  String? gameId;
  GameLevelEnumsModel? level;
  int? gameStatus;
  DateTime? gameDateStart;
  String? mallName;

  GameModel(
      {this.gameAccepted,
      this.msg,
      this.gameId,
      this.level,
      this.gameDateStart,
      this.gameStatus,
      this.mallName});

  GameModel.fromJson(Map<String, dynamic> json) {
    gameAccepted = json['gameAccepted'];
    msg = json['msg'];
    gameId = json['game_id'];
    level = level?.fromStringToGameLevelEnumsModel(json['game_level']);
    gameStatus = json['gameStatus'];
    mallName = json['mall_name'];
    gameDateStart = json['game_dateStart'] != null
        ? DateTime.parse(json['game_dateStart'] as String)
        : null;
  }
}
