import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/constants/assets.dart';
import 'package:mall_app/ui/pages/qr/qr_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/qr/models/qr_type_enums_model.dart';
import '../../../routes.dart';
import '../../widget/costume_appbar.dart';
import '../../widget/invoice_widget.dart';
import '../../widget/lined_text.dart';

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
  void initState() {
    super.initState();
    _con.setDaily(widget.arguments.daily);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            CostumeAppBar(
                title: widget.arguments.title,
                returnToDetails: true,
                gameDetails: GameDetails(
                    mallName: widget.arguments.mallName ?? '',
                    mallId: widget.arguments.mallId,
                    gameId: widget.arguments.gameId)),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (_con.qrModelResult == null)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 45.0,
                                    ),
                                    //TODO
                                    Text(
                                      'اشتر فاتورة من أحد المحلات المشتركة معنا\n بقيمة ${widget.arguments.billAmount} ${widget.arguments.currency} على الأقل  \n ثم امسح باركود QR الخاص بها',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Image.asset(
                                      Assets.assetsQrCode1,
                                      width: 200,
                                      height: 200,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              if (_con.qrModelResult != null)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    if (_con.qrModelResult?.qrType ==
                                        QrTypeParamsModel.invoice)
                                      InvoiceWidget(
                                          taxNumber: _con
                                              .qrModelResult!.taxNumber
                                              .toString(),
                                          name: _con.qrModelResult!.seller,
                                          date: _con.qrModelResult!.date
                                              .toString(),
                                          invoiceAmount: _con
                                              .qrModelResult!.cost
                                              .toString(),
                                          taxAmount: _con.qrModelResult!.vat
                                              .toString()),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                    Text(
                                      _con.qrModelResult!.invoiceAccepted!
                                          ? S
                                              .of(context)
                                              .congratulationYourInvoiceAccepted
                                          : S
                                              .of(context)
                                              .sorryYourInvoiceHasNotAccepted,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: AppColors.appOrange,
                                              fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      _con.qrModelResult!.msg ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              fontSize: 18,
                                              color: AppColors.blackColor),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                ),
                            ]),
                      ]),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    if (_con.qrModelResult == null)
                      ElevatedButton(
                        onPressed: () async {
                          var data = await Navigator.pushNamed(
                              context, Routes.scanQrScreen);

                          if (data != null) {
                            _con.sendQr(
                                data: data.toString(),
                                gameId: widget.arguments.gameId,
                                mallId: widget.arguments.mallId,
                                qrType: QrTypeParamsModel.invoice);
                          }
                        },
                        child: Text(S.of(context).scanInvoiceBarcode),
                      )
                    else if (_con.qrModelResult!.status!
                        .contains('invoice_accepted_daily'))
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, Routes.pontQrScreen,
                              arguments: InvoiceQrArguments(
                                mallId: widget.arguments.mallId,
                                gameId: widget.arguments.gameId,
                                title: widget.arguments.title,
                                daily: widget.arguments.daily,
                                billAmount: widget.arguments.billAmount,
                                currency: widget.arguments.currency,
                                balancePoints:
                                    _con.qrModelResult?.balancePoints ?? 0,
                                targetPoints:
                                    _con.qrModelResult?.targetPoints ?? 0,
                              ));
                        },
                        child: Text(S.of(context).letUsCollectPoints),
                      )
                    else if (_con.qrModelResult!.status!
                        .contains('invoice_accepted_zero'))
                      ElevatedButton(
                        onPressed: () async {
                          var data = await Navigator.pushNamed(
                              context, Routes.scanQrScreen);

                          if (data != null) {
                            _con.sendQr(
                                data: data.toString(),
                                gameId: widget.arguments.gameId,
                                mallId: widget.arguments.mallId,
                                qrType: QrTypeParamsModel.invoice);
                          }
                        },
                        child: Text(S.of(context).scanInvoiceBarcode),
                      )
                    else
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).backTopreviousLevel),
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.shareShopsScreen,
                            arguments: ShopArguments(
                                mallName: widget.arguments.mallName ?? '',
                                mallId: widget.arguments.mallId));
                      },
                      child: LinedText(
                        color: AppColors.primaryColor,
                        text: S.of(context).browseSubscriptionMarkets,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
