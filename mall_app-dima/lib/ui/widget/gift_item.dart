import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_theme.dart';
import '../../generated/l10n.dart';
import '../../main_sdk/apis/gift/models/gift_model.dart';

class GiftItem extends StatelessWidget {
  const GiftItem({
    Key? key,
    required GiftModel gift,
    this.fromGrid = false,
  })  : _gift = gift,
        super(key: key);

  final GiftModel _gift;
  final bool fromGrid;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(_gift.giftName ?? ''),
              content: Container(
                child: Text(_gift.giftDescription ?? ''),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(S.of(context).ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: fromGrid ? 160 : 130,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: AppColors.appYellow),
            color: AppColors.grayColor.withOpacity(0.1)),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                width: fromGrid ? 120 : 50,
                height: fromGrid ? 120 : 60,
                child: Lottie.asset('assets/lottie/gift.json')),
            Text(
              _gift.giftName ?? '',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
