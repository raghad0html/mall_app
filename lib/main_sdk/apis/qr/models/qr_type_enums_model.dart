enum QrTypeParamsModel{
  sticker,
  invoice,

}
extension ParseToString on QrTypeParamsModel {
  String toShortString() {
    return toString().split('.').last;
  }
}
extension GetQrTypeParamsModelFromString on QrTypeParamsModel {
  QrTypeParamsModel fromStringToDayName(String prefix) {
    switch (prefix.toLowerCase()) {
      case 'sticker':
        return QrTypeParamsModel.sticker;
      case 'invoice':
      default:
        return QrTypeParamsModel.invoice;
    }
  }
}