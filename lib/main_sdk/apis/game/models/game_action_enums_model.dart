enum GameActionEnumsModel{
  createGame,
  getGameLevel,

}
extension ParseToString on GameActionEnumsModel {
  String toShortString() {
    return toString().split('.').last;
  }
}
extension GameActionEnumsModelFromString on GameActionEnumsModel {
  GameActionEnumsModel fromStringToGameActionEnumsModel(String prefix) {
    switch (prefix.toLowerCase()) {
      case 'createGame':
        return GameActionEnumsModel.createGame;
      case 'getGameLevel':
      default:
        return GameActionEnumsModel.getGameLevel;
    }
  }
}