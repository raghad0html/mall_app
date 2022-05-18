import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/shop_details_page/shop_details_controller.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mall_app/ui/widget/custom_dialog_product.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../main_sdk/apis/gift/models/gift_model.dart';
import '../../widget/gift_item.dart';
import '../../widget/lined_text.dart';

class ShopDetailsPage extends StatefulWidget {
  final ShopArguments shopArguments;

  const ShopDetailsPage({Key? key, required this.shopArguments})
      : super(key: key);

  @override
  _ShopDetailsPageState createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends StateMVC<ShopDetailsPage> {
  late ShopDetailsController _con;

  _ShopDetailsPageState() : super(ShopDetailsController()) {
    _con = controller as ShopDetailsController;
  }

  @override
  void initState() {
    super.initState();
    _con.getProducts(widget.shopArguments.mallId.toString());
    _con.getGifts(widget.shopArguments.mallId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CostumeAppBar(title: widget.shopArguments.mallName),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      color: AppColors.appYellow.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.giftsForShopScreen,
                                    arguments: ShopArguments(
                                        mallName: widget.shopArguments.mallName,
                                        mallId: widget.shopArguments.mallId));
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      S.of(context).giftsGiven,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  LinedText(
                                    color: AppColors.basicColor,
                                    text: S.of(context).showAll,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                // shrinkWrap: true,
                                // primary: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: _con.gifts.length,
                                itemBuilder: (context, i) {
                                  GiftModel _gift = _con.gifts[i];

                                  return GiftItem(gift: _gift);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.allGamesScreen);
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    S.of(context).ourProducts,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                // const LinedText(
                                //   color: AppColors.basicColor,
                                //   text: 'عرض الكل',
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          _con.products.isEmpty && _con.loading
                              ? const Center(child: CircularProgressIndicator())
                              : GridView.builder(
                                  itemCount: _con.products.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemBuilder: (context, gridViewIndex) {
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            //  barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              //TODO
                                              return CustomDialogProduct(
                                                  title: _con
                                                          .products[
                                                              gridViewIndex]
                                                          .name ??
                                                      '',
                                                  price: _con
                                                              .products[
                                                                  gridViewIndex]
                                                              .price !=
                                                          null
                                                      ? 'السعر: ${_con.products[gridViewIndex].price} ريال '
                                                      : '',
                                                  description: _con
                                                              .products[
                                                                  gridViewIndex]
                                                              .prodDescription !=
                                                          null
                                                      ? 'الوصف: ${_con.products[gridViewIndex].prodDescription}'
                                                      : '');
                                            });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        padding: const EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                height: 130,
                                                progressIndicatorBuilder:
                                                    (context, url, progress) =>
                                                        Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: progress.progress,
                                                  ),
                                                ),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    const Icon(
                                                        Icons.error_outline),
                                                imageUrl: _con
                                                        .products[gridViewIndex]
                                                        .picture ??
                                                    '',
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.all(10),
                                              alignment: Alignment.bottomRight,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _con.products[gridViewIndex]
                                                            .name ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1
                                                        ?.copyWith(height: 1.1),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    _con.products[gridViewIndex]
                                                            .price
                                                            ?.toString() ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1
                                                        ?.copyWith(
                                                            height: 1.1,
                                                            fontSize: 13),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
