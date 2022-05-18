enum MallActionEnumsModel{
  getCity,
  getMalls,
  getMallsByCity

}
extension ParseToString on MallActionEnumsModel {
  String toShortString() {
    return toString().split('.').last;
  }
}
extension GameActionEnumsModelFromString on MallActionEnumsModel {
  MallActionEnumsModel fromStringToMallActionEnumsModel(String prefix) {
    switch (prefix.toLowerCase()) {
      case 'getCity':
        return MallActionEnumsModel.getCity;
        case 'getMallsByCity':
        return MallActionEnumsModel.getMallsByCity;
      case 'getMalls':
      default:
        return MallActionEnumsModel.getMalls;
    }
  }
}