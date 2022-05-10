import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../main_sdk/apis/mall/models/mall_model.dart';

class MallWidget extends StatelessWidget {
  const MallWidget({
    Key? key,
    required this.mall,
  }) : super(key: key);

  final MallModel mall;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {},
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  height: 110,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                  imageUrl: mall.icon ?? '',
                ),
              ),
              Text(
                mall.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(height: 1.1),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }
}
