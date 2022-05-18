enum GameActionEnumsModel {
  createGame,
  getGameLevel,
  getGames,
  getActiveGames,
  getExpiredGames,
  getGamesMall
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
      case 'getGames':
        return GameActionEnumsModel.createGame;
      case 'getActiveGames':
        return GameActionEnumsModel.getActiveGames;
      case 'getExpiredGames':
        return GameActionEnumsModel.getExpiredGames;
      case 'getGamesMall':
        return GameActionEnumsModel.getGamesMall;
      case 'getGameLevel':
      default:
        return GameActionEnumsModel.getGameLevel;
    }
  }
}
