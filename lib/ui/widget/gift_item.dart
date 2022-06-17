import 'package:cached_network_image/cached_network_image.dart';
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
              title: Center(child: Text(_gift.giftName ?? '')),
              content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_gift.giftDescription ?? ''),
                    Text('تقدمة: ${_gift.giftByName}'),
                    if (_gift.giftReceived == 1)
                      Text('الى: ${_gift.giftReceiverName}'),
                  ],
                ),
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
        //  padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                width: fromGrid ? 120 : 50,
                height: fromGrid ? 120 : 60,
                child: _gift.giftPicture != null
                    ? CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline),
                        imageUrl: _gift.giftPicture!,
                      )
                    : Lottie.asset('assets/lottie/gift.json')),
            Text(_gift.giftName ?? '',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    decoration: _gift.giftReceived == 1
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
            if (_gift.giftReceived == 1)
              Text(
                '[مُستلمة]',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red, fontSize: 14),
              ),
          ],
        ),
      ),
    );
  }
}
