class GameModel {
  bool? gameAccepted;
  String? msg;
  String? gameId;

  GameModel({this.gameAccepted, this.msg});

  GameModel.fromJson(Map<String, dynamic> json) {
    gameAccepted = json['gameAccepted'];
    msg = json['msg'];
    gameId = json['game_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['gameAccepted'] = gameAccepted;
    data['msg'] = msg;
    data['game_id'] = gameId;
    return data;
  }
}