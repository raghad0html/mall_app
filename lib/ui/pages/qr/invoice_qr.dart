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
        child: Column(
          children: [
            CostumeAppBar(title: widget.arguments.title),
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
                                    Text(
                                      S.of(context).invoiceDescription,
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
                                    InvoiceWidget(
                                        taxNumber: _con.qrModelResult!.taxNumber
                                            .toString(),
                                        name: _con.qrModelResult!.seller,
                                        date:
                                            _con.qrModelResult!.date.toString(),
                                        invoiceAmount:
                                            _con.qrModelResult!.cost.toString(),
                                        taxAmount:
                                            _con.qrModelResult!.vat.toString()),
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
                                          .copyWith(color: AppColors.appOrange),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      _con.qrModelResult!.msg ?? '',
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    // if (widget.arguments.daily &&
                                    //     _con.qrModelResult!.invoiceAccepted!)
                                    //   ElevatedButton(
                                    //     onPressed: () async {
                                    //       Navigator.pushNamed(
                                    //           context, Routes.pontQrScreen,
                                    //           arguments: InvoiceQrArguments(
                                    //             mallId: widget.arguments.mallId,
                                    //             gameId: widget.arguments.gameId,
                                    //             title: widget.arguments.title,
                                    //             daily: widget.arguments.daily,
                                    //             balancePoints: _con
                                    //                     .qrModelResult
                                    //                     ?.balancePoints ??
                                    //                 0,
                                    //             targetPoints: _con.qrModelResult
                                    //                     ?.targetPoints ??
                                    //                 0,
                                    //           ));
                                    //     },
                                    //     child: Text(
                                    //         S.of(context).letsCollect500Points),
                                    //   ),
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
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 1, // Space between underline and text
                      ),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.0, // Underline thickness
                      ))),
                      child: Text(
                        S.of(context).browseSubscriptionMarkets,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 16.0,
                            height: 1
                            //  decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (widget.arguments.daily &&
                        _con.qrModelResult!.invoiceAccepted!)
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, Routes.pontQrScreen,
                              arguments: InvoiceQrArguments(
                                mallId: widget.arguments.mallId,
                                gameId: widget.arguments.gameId,
                                title: widget.arguments.title,
                                daily: widget.arguments.daily,
                                balancePoints:
                                    _con.qrModelResult?.balancePoints ?? 0,
                                targetPoints:
                                    _con.qrModelResult?.targetPoints ?? 0,
                              ));
                        },
                        child: Text(S.of(context).letsCollect500Points),
                      )
                    else
                      ElevatedButton(
                        onPressed: () async {
                          // _con.sendQr(
                          // data:
                          //     'AULYtNix2YPYqSDYsdmI2YUg2KfZhNiq2KzYp9ix2YrYqSDYp9mE2YXYrdiv2YjYr9ipIC0g2YHYsdi5INix2YjZhTECDzMxMDA0NzA0MTEwMDAwMwMUMjAyMi0wNC0yMVQxMTo1Nzo0MloEBTE3Mi41BQEw',
                          // gameId: widget.arguments.gameId,
                          // mallId: widget.arguments.mallId,
                          // qrType: QrTypeParamsModel.invoice);
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
