import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/ui/pages/qr/qr_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/qr/models/qr_type_enums_model.dart';
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
        child: Column(
          children: [
            Container(
              color: AppColors.lightGrey,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                    widget.arguments.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  )))
                ],
              ),
            ),
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
                              const SizedBox(
                                height: 45.0,
                              ),
                              if (widget.arguments.daily)
                                Text(
                                  'اشتر فاتورة من أحد المحلات المشتركة معنا\n بقيمة 300 ريال على الأقل '
                                  '\n ثم امسح باركود QR الخاص بها ',
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
                                'assets/images/qr-code1.png',
                                width: 200,
                                height: 200,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),

                              // ElevatedButton(
                              //   onPressed: () async {
                              //     // _con.sendQr(
                              //         // data:
                              //         //     'AULYtNix2YPYqSDYsdmI2YUg2KfZhNiq2KzYp9ix2YrYqSDYp9mE2YXYrdiv2YjYr9ipIC0g2YHYsdi5INix2YjZhTECDzMxMDA0NzA0MTEwMDAwMwMUMjAyMi0wNC0yMVQxMTo1Nzo0MloEBTE3Mi41BQEw',
                              //         // gameId: widget.arguments.gameId,
                              //         // mallId: widget.arguments.mallId,
                              //         // qrType: QrTypeParamsModel.invoice);
                              //     var data =
                              //         await Navigator.pushNamed(context, Routes.scanQrScreen);
                              //
                              //     if (data != null) {
                              //       _con.sendQr(
                              //           data: data.toString(),
                              //           gameId: widget.arguments.gameId,
                              //           mallId: widget.arguments.mallId,
                              //           qrType: QrTypeParamsModel.invoice);
                              //     }
                              //   },
                              //   child: Text(S.of(context)!.scanQr),
                              // ),
                              if (_con.qrModelResult != null)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      _con.qrModelResult!.invoiceAccepted!
                                          ? S
                                              .of(context)!
                                              .congratulationYourInvoiceAccepted
                                          : S
                                              .of(context)!
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
                                    if (widget.arguments.daily &&
                                        _con.qrModelResult!.invoiceAccepted!)
                                      ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                              context, Routes.pontQrScreen,
                                              arguments: InvoiceQrArguments(
                                                  mallId:
                                                      widget.arguments.mallId,
                                                  gameId:
                                                      widget.arguments.gameId,
                                                  title: widget.arguments.title,
                                                  daily:
                                                      widget.arguments.daily));
                                        },
                                        child: Text(S
                                            .of(context)!
                                            .letsCollect500Points),
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
                        'عرض المحلات المشتركة',
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
                      child: Text('مسح باركود فاتورة'),
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
