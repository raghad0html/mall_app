import 'package:mall_app/main_sdk/apis/game/models/game_level_enums_model.dart';

class ListOfGameModel {
  ListOfGameModel({
    this.data,
  });

  ListOfGameModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(GameModel.fromJson(v));
      });
    }
  }

  List<GameModel>? data;
}

class GameModel {
  bool? gameAccepted;
  String? msg;
  int? gameId;
  GameLevelEnumsModel? level;
  int? targetPoints;
  int? balancePoints;
  String? mallName;
  String? gameDateStart;

  GameModel(
      {this.gameAccepted,
      this.msg,
      this.gameId,
      this.level,
      this.mallName,
      this.balancePoints,
      this.targetPoints,
      this.gameDateStart});

  GameModel.fromJson(Map<String, dynamic> json) {
    gameAccepted = json['gameAccepted'];
    msg = json['msg'];
    gameId = json['game_id'];
    level = fromStringToGameLevelEnumsModel1(json['level'] ?? 'zero');
    targetPoints = json['target_points'];
    balancePoints = json['balance_points'];
    mallName = json['mall_name'];
    gameDateStart = json['game_dateStart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameAccepted'] = gameAccepted;
    data['msg'] = msg;
    data['game_id'] = gameId;
    data['level'] = level;
    data['target_points'] = targetPoints;
    data['balance_points'] = balancePoints;
    data['mall_name'] = mallName;
    data['game_dateStart'] = gameDateStart;
    return data;
  }
}
