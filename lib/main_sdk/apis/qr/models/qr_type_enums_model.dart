enum QrTypeParamsModel {
  sticker,
  invoice,
}

extension ParseToString on QrTypeParamsModel {
  String toShortString() {
    return toString().split('.').last;
  }
}

QrTypeParamsModel fromStringToQrTypeParamsModel1(String prefix) {
  switch (prefix.toLowerCase()) {
    case 'sticker':
      return QrTypeParamsModel.sticker;
    case 'invoice':
    default:
      return QrTypeParamsModel.invoice;
  }
}

extension GetQrTypeParamsModelFromString on QrTypeParamsModel {
  QrTypeParamsModel fromStringToQrTypeParamsModel(String prefix) {
    switch (prefix.toLowerCase()) {
      case 'sticker':
        return QrTypeParamsModel.sticker;
      case 'invoice':
      default:
        return QrTypeParamsModel.invoice;
    }
  }
}
