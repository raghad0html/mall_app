import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/qr/qr_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../generated/l10n.dart';
import '../../../routes.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Expanded(child: Center(child: Text(widget.arguments.title)))
                ],
              ),
              const SizedBox(
                height: 45.0,
              ),
              if (widget.arguments.daily)
                Text(
                  'بعض الكلمات التحفيزية وصورة ',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              Text(
                S.of(context).letsCollect500Points,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  // _con.sendQr(
                  //     data:
                  //         'https://bareeqe.sa/?I3N0aWNrZXIjMzEwMDQ3MDQxMTAwMDAzI0FBQUE=',
                  //     gameId: widget.arguments.gameId,
                  //     mallId: widget.arguments.mallId);
                  var data =
                      await Navigator.pushNamed(context, Routes.scanQrScreen);

                  if (data != null) {
                    _con.sendQr(
                        data: data.toString(),
                        gameId: widget.arguments.gameId,
                        mallId: widget.arguments.mallId);
                  }
                },
                child: const Text('Scan Qr'),
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
                      height: 8.0,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
