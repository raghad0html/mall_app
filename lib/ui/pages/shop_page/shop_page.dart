import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/main_sdk/apis/shop/models/shop_model.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/shop_page/shop_controller.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../widget/shop_item.dart';

class ShopsPage extends StatefulWidget {
  final ShopArguments shopArguments;

  const ShopsPage({Key? key, required this.shopArguments}) : super(key: key);

  @override
  _ShopsPageState createState() => _ShopsPageState();
}

class _ShopsPageState extends StateMVC<ShopsPage> {
  late ShopController _con;

  _ShopsPageState() : super(ShopController()) {
    _con = controller as ShopController;
  }

  @override
  void initState() {
    super.initState();
    _con.getShops(widget.shopArguments.mallId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CostumeAppBar(
            title: widget.shopArguments.mallName,
          ),
          Expanded(
            child: Builder(builder: (context) {
              if (_con.shops.isEmpty && _con.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (_con.shops.isNotEmpty) {
                return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _con.shops.length,
                    itemBuilder: (context, index) {
                      ShopModel shop = _con.shops[index];
                      return ShopItem(
                        shop: shop,
                      );
                    });
              } else {
                return Center(
                  child: Text(S.of(context).noShop),
                );
              }
            }),
          ),
        ],
      )),
    );
  }
}
// class ShopItem extends StatelessWidget {
//   ShopModel shop;
//   ShopItem({Key? key, required this.shop}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, Routes.shopDetailsScreen,
//             arguments: ShopArguments(
//                 mallName: shop.shopName ?? '',
//                 mallId: shop.shopId!,
//                 image: shop.picture));
//       },
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.black12,
//           border: Border.all(color: Colors.white),
//           borderRadius:
//           const BorderRadius.all(Radius.circular(8)),
//         ),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10)),
//               child: CachedNetworkImage(
//                 height: 170,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 progressIndicatorBuilder:
//                     (context, url, progress) => Center(
//                   child: CircularProgressIndicator(
//                     value: progress.progress,
//                   ),
//                 ),
//                 errorWidget: (context, url, error) =>
//                 const Icon(Icons.error_outline),
//                 imageUrl: shop.picture ?? '',
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.all(10),
//               alignment: Alignment.bottomRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.end,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           shop.shopName ?? '',
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleLarge
//                               ?.copyWith(height: 1.1),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       if (shop.shopPlan != null)
//                         Image.asset(
//                           shop.shopPlan == 2
//                               ? Assets.iconPlan1
//                               : shop.shopPlan == 5
//                               ? Assets.iconPlan2
//                               : shop.shopPlan == 8
//                               ? Assets.iconPlan3
//                               : Assets.iconPlan4,
//                           width: 35,
//                           height: 35,
//                         )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 15, bottom: 15),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         if (shop.shapPhone != null)
//                           InkWell(
//                             onTap: () async {
//                               await Launcher().makePhoneCall(
//                                   '${shop.shapPhone}');
//                             },
//                             child: SizedBox(
//                               height: 40,
//                               child: Row(
//                                 children: [
//                                   const Icon(Icons.call),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     '${shop.shapPhone}',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelMedium
//                                         ?.copyWith(
//                                         height: 1.1,
//                                         fontSize: 15),
//                                     maxLines: 2,
//                                     overflow:
//                                     TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         if (shop.shopEmail != null)
//                           InkWell(
//                             onTap: () async {
//                               await Launcher().sendEmail(shop.shopEmail!);
//                             },
//                             child: SizedBox(
//                               height: 40,
//                               child: Row(
//                                 children: [
//                                   const Icon(Icons.email),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     '${shop.shopEmail}',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelMedium
//                                         ?.copyWith(
//                                         height: 1.1,
//                                         fontSize: 15),
//                                     maxLines: 2,
//                                     overflow:
//                                     TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   if (shop.shopAddress != null)
//                     InkWell(
//                       onTap: () {
//                         if (shop.shopAddressLat != null &&
//                             shop.shopAddressLon != null) {
//                           MapsSheet.show(
//                               context: context,
//                               latUser: shop.shopAddressLat!,
//                               longUser: shop.shopAddressLon!,
//                               title: shop.shopAddress!);
//                         }
//                       },
//                       child: SizedBox(
//                         height: 40,
//                         child: Row(
//                           children: [
//                             const Icon(
//                                 Icons.location_on_rounded),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               '${shop.shopAddress}',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .labelMedium
//                                   ?.copyWith(
//                                   height: 1.1,
//                                   fontSize: 15),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
