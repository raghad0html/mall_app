import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'dot_widget.dart';
import 'invoice_details_text.dart';

// ignore: must_be_immutable
class InvoiceWidget extends StatelessWidget {
  String? name;
  String? taxNumber;
  String? date;
  String? invoiceAmount;
  String? taxAmount;
  InvoiceWidget(
      {Key? key,
      required this.taxNumber,
      required this.name,
      required this.date,
      required this.invoiceAmount,
      required this.taxAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.text_snippet_outlined),
              const SizedBox(
                width: 5,
              ),
              Text(
                S.of(context).invoiceDetails,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          const Divider(),
          InvoiceDetailsText(
            title: S.of(context).name,
            message: name ?? '',
          ),
          const DotWidget(),
          InvoiceDetailsText(
            title: S.of(context).taxNumber,
            message: taxNumber ?? '',
          ),
          const DotWidget(),
          InvoiceDetailsText(
            title: S.of(context).date,
            message: date ?? '',
          ),
          const DotWidget(),
          InvoiceDetailsText(
            title: S.of(context).amount,
            message: invoiceAmount ?? '',
          ),
          const DotWidget(),
          InvoiceDetailsText(
            title: S.of(context).taxAmount,
            message: taxAmount ?? '',
          ),
        ],
      ),
    );
  }
}
