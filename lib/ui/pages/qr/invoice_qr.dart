import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/ui/pages/qr/qr_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../routes.dart';
import '../../widget/invoice_widget.dart';

class InvoiceQrScreen extends StatefulWidget {
  final InvoiceQrArguments arguments;
  const InvoiceQrScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  _InvoiceQrScreenState createState() => _InvoiceQrScreenState();
}

class _InvoiceQrScreenState extends StateMVC<InvoiceQrScreen> {
  late QRController _con;

  _InvoiceQrScreenState() : super(QRController()) {
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
                  'بعض الكلمات التحفيزية ',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              Text(
                S.of(context).letsStartToScanAQrForYourBill,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  // _con.sendQr(
                  //     data:
                  //         'AULYtNix2YPYqSDYsdmI2YUg2KfZhNiq2KzYp9ix2YrYqSDYp9mE2YXYrdiv2YjYr9ipIC0g2YHYsdi5INix2YjZhTECDzMxMDA0NzA0MTEwMDAwMwMUMjAyMi0wNC0yMVQxMTo1Nzo0MloEBTE3Mi41BQEw',
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
                child: Text(S.of(context).scanQr),
              ),
              if (_con.qrModelResult != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      _con.qrModelResult!.invoiceAccepted!
                          ? S.of(context).congratulationYourInvoiceAccepted
                          : S.of(context).sorryYourInvoiceHasNotAccepted,
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
                    InvoiceWidget(
                        taxNumber: _con.qrModelResult!.taxNumber.toString(),
                        name: _con.qrModelResult!.seller,
                        date: _con.qrModelResult!.date.toString(),
                        invoiceAmount: _con.qrModelResult!.cost.toString(),
                        taxAmount: _con.qrModelResult!.vat.toString()),
                    const SizedBox(
                      height: 24.0,
                    ),
                    if (widget.arguments.daily)
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, Routes.pontQrScreen,
                              arguments: InvoiceQrArguments(
                                  mallId: widget.arguments.mallId,
                                  gameId: widget.arguments.gameId,
                                  title: widget.arguments.title,
                                  daily: widget.arguments.daily));
                        },
                        child: Text(S.of(context).letsCollect500Points),
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
