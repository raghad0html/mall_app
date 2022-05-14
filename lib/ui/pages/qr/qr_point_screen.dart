import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/qr/qr_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../constants/assets.dart';
import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/qr/models/qr_type_enums_model.dart';
import '../../../routes.dart';
import '../../widget/costume_appbar.dart';
import '../../widget/lined_text.dart';

class PointQRScreen extends StatefulWidget {
  final InvoiceQrArguments arguments;
  const PointQRScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  _PointQRScreenState createState() => _PointQRScreenState();
}

class _PointQRScreenState extends StateMVC<PointQRScreen> {
  late QRController _con;

  _PointQRScreenState() : super(QRController()) {
    _con = controller as QRController;
  }

  @override
  void initState() {
    super.initState();
    debugPrint(
        'widget.arguments.targetPoints ${widget.arguments.targetPoints}');
    _con.initPoints(
        targetPointsWidget: widget.arguments.targetPoints,
        balancePointsWidget: widget.arguments.balancePoints);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'widget.arguments.balancePoints ${widget.arguments.balancePoints}');
    return Scaffold(
      key: _con.scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            CostumeAppBar(title: widget.arguments.title),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 45.0,
                        ),
                        if (widget.arguments.daily)
                          Text(
                            'لإنهاء المسابقة اليومية \n عليك التوجه للمحلات المشاركة \n ومسح لصاقة باركود QR لكسب النقاط والفوز',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          Assets.assetsQrCode2,
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        if (_con.qrModelResult != null)
                          Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                S.of(context).letsStartToScanAQrForYourBill,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: AppColors.appOrange),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                _con.qrModelResult!.msg ?? '',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                            ],
                          ),
                        Text(
                          'رصيد نقاطك الحالي هو ',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${_con.balancePoints}/${_con.targetPoints}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ),
              ),
            ),
            LinedText(
              color: AppColors.primaryColor,
              text: S.of(context).browseSubscriptionMarkets,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    // _con.sendQr(
                    //     data:
                    //         'https://bareeqe.sa/?I3N0aWNrZXIjMzEwMDQ3MDQxMTAwMDAzI0FBQUE=',
                    //     gameId: widget.arguments.gameId,
                    //     mallId: widget.arguments.mallId);

                    if (_con.targetPoints > _con.balancePoints) {
                      var data = await Navigator.pushNamed(
                          context, Routes.scanQrScreen);

                      if (data != null) {
                        _con.sendQr(
                            data: data.toString(),
                            gameId: widget.arguments.gameId,
                            mallId: widget.arguments.mallId,
                            qrType: QrTypeParamsModel.sticker);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('لا يمكنك مسح فاتورة تأكد من عدد نقاطك')));
                    }
                  },
                  child: const Text('مسح باركود محل'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
