import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/product/models/product_model.dart';

import 'custom_dialog_product.dart';

class ProductItem extends StatelessWidget {
  ProductModel product;
  ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              //TODO
              return CustomDialogProduct(
                  title: product.name ?? '',
                  price: product.price != null
                      ? 'السعر: ${product.price} ريال '
                      : '',
                  description: product.prodDescription != null
                      ? 'الوصف: ${product.prodDescription}'
                      : '');
            });
      },
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
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  height: 100,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                  imageUrl: product.picture ?? '',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(height: 1.1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(height: 1.1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // InkWell(
                  //   onTap: ()async{
                  //     await Launcher().launchInBrowser(
                  //         Uri(scheme: 'https',host: mall.linkApp?.replaceAll('https://', '') ?? ""));
                  //   },
                  //   child: Text(
                  //     mall.linkApp ?? '',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .subtitle1
                  //         ?.copyWith(height: 1.1, fontSize: 13),
                  //     maxLines: 2,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
