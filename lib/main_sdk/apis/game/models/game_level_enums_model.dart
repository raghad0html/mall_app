enum GameLevelEnumsModel {
  zero,
  dailyDone,
  dailyProgress,
  weeklyDone,
  monthlyDone,
  quarterlyDone,
  errorDetectLevel,
}

extension ParseToString on GameLevelEnumsModel {
  String toShortString() {
    return toString().split('.').last;
  }
}

GameLevelEnumsModel fromStringToGameLevelEnumsModel1(String prefix) {
  switch (prefix) {
    case 'zero':
      return GameLevelEnumsModel.zero;
    case 'dailyDone':
      return GameLevelEnumsModel.dailyDone;
    case 'dailyProgress':
      return GameLevelEnumsModel.dailyProgress;
    case 'weeklyDone':
      return GameLevelEnumsModel.weeklyDone;
    case 'monthlyDone':
      return GameLevelEnumsModel.monthlyDone;
    case 'quarterlyDone':
      return GameLevelEnumsModel.quarterlyDone;
    case 'errorDetectLevel':
    default:
      return GameLevelEnumsModel.errorDetectLevel;
  }
}

extension GetQrTypeParamsModelFromString on GameLevelEnumsModel {
  GameLevelEnumsModel fromStringToGameLevelEnumsModel(String prefix) {
    switch (prefix) {
      case 'zero':
        return GameLevelEnumsModel.zero;
      case 'dailyDone':
        return GameLevelEnumsModel.dailyDone;
      case 'dailyProgress':
        return GameLevelEnumsModel.dailyProgress;
      case 'weeklyDone':
        return GameLevelEnumsModel.weeklyDone;
      case 'monthlyDone':
        return GameLevelEnumsModel.monthlyDone;
      case 'quarterlyDone':
        return GameLevelEnumsModel.quarterlyDone;
      case 'errorDetectLevel':
      default:
        return GameLevelEnumsModel.errorDetectLevel;
    }
  }
}
