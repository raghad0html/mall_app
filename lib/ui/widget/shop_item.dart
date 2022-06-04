import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../main_sdk/apis/shop/models/shop_model.dart';
import '../../routes.dart';
import '../shared/future_builder_widget/lancher.dart';
//import 'maps_sheet.dart';

class ShopItem extends StatelessWidget {
  ShopModel shop;
  ShopItem({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.shopDetailsScreen,
            arguments: ShopArguments(
                mallName: shop.shopName ?? '',
                mallId: shop.shopId!,
                image: shop.picture));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          shop.shopName ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(height: 1.1),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (shop.shopPlan != null)
                        Image.asset(
                          shop.shopPlan == 2
                              ? Assets.iconPlan1
                              : shop.shopPlan == 5
                                  ? Assets.iconPlan2
                                  : shop.shopPlan == 8
                                      ? Assets.iconPlan3
                                      : Assets.iconPlan4,
                          width: 35,
                          height: 35,
                        )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (shop.shopPhone != null)
                          InkWell(
                            onTap: () async {
                              await Launcher()
                                  .makePhoneCall(shop.shopPhone.toString());
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Icon(Icons.call),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    shop.shopPhone.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(height: 1.1, fontSize: 15),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (shop.shopEmail?.isNotEmpty??false)
                          InkWell(
                            onTap: () async {
                              await Launcher().sendEmail(shop.shopEmail!);
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    shop.shopEmail?.toString() ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(height: 1.1, fontSize: 15),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (shop.shopAddress?.isNotEmpty ??false)
                        InkWell(
                          onTap: () {
                            if ((shop.shopAddressLat?.isNotEmpty??false)  &&
                                (shop.shopAddressLon?.isNotEmpty??false)) {
                              /*
                              MapsSheet.show(
                                  context: context,
                                  latUser: double.parse(shop.shopAddressLat!),
                                  longUser: double.parse(shop.shopAddressLon!),
                                  title: shop.shopAddress!);
                              */
                            }
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                const Icon(Icons.location_on_rounded),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  shop.shopAddress?.toString() ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(height: 1.1, fontSize: 15),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          const Icon(Icons.qr_code),
                          const SizedBox(
                            width: 5,
                          ),
                          //TODO
                          Text(
                            shop.shopPlan != null
                                ? 'النقاط: + ${shop.shopPlan}'
                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(height: 1.1, fontSize: 15),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
