class GameModel {
  bool? gameAccepted;
  String? msg;

  GameModel({this.gameAccepted, this.msg});

  GameModel.fromJson(Map<String, dynamic> json) {
    gameAccepted = json['gameAccepted'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['gameAccepted'] = gameAccepted;
    data['msg'] = msg;
    return data;
  }
}