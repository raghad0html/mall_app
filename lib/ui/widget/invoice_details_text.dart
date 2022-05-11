import 'package:flutter/material.dart';

class InvoiceDetailsText extends StatelessWidget {
  String title;
  String message;
  InvoiceDetailsText({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16),
          ),
          const TextSpan(text: ' '),
          TextSpan(text: message, style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }
}
