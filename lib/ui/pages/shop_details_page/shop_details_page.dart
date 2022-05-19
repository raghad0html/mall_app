import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/shop_details_page/shop_details_controller.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../main_sdk/apis/gift/models/gift_model.dart';
import '../../../main_sdk/apis/product/models/product_model.dart';
import '../../widget/gift_item.dart';
import '../../widget/lined_text.dart';
import '../../widget/product_item.dart';

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
                                  //  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 18,
                                          mainAxisSpacing: 18),
                                  // gridDelegate:
                                  //     const SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 2),
                                  itemBuilder: (context, gridViewIndex) {
                                    ProductModel _product =
                                        _con.products[gridViewIndex];
                                    return ProductItem(
                                      product: _product,
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
