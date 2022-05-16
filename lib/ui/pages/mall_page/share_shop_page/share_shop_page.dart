import 'package:flutter/material.dart';
import 'package:mall_app/constants/assets.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/mall_page/share_shop_page/share_shop_controller.dart';
import 'package:mall_app/ui/shared/future_builder_widget/lancher.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mall_app/ui/widget/maps_sheet.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ShareShopsPage extends StatefulWidget {
  final ShopArguments shopArguments;

  const ShareShopsPage({Key? key, required this.shopArguments})
      : super(key: key);

  @override
  _ShareShopsPageState createState() => _ShareShopsPageState();
}

class _ShareShopsPageState extends StateMVC<ShareShopsPage> {
  late ShareShopController _con;

  _ShareShopsPageState() : super(ShareShopController()) {
    _con = controller as ShareShopController;
  }

  @override
  void initState() {
    super.initState();
    _con.getShareShops(widget.shopArguments.mallId.toString());
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
                print(_con.shops[0].shopPlan);
                return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _con.shops.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.shopDetailsScreen,
                              arguments: ShopArguments(
                                  mallName: _con.shops[index].shopName ?? '',
                                  mallId: _con.shops[index].shopId!,
                                  image: _con.shops[index].picture));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _con.shops[index].shopName ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(height: 1.1),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (_con.shops[index].shopPlan != null)
                                          Image.asset(
                                            _con.shops[index].shopPlan == 2
                                                ? Assets.iconPlan1
                                                : _con.shops[index].shopPlan ==
                                                        5
                                                    ? Assets.iconPlan2
                                                    : _con.shops[index]
                                                                .shopPlan ==
                                                            8
                                                        ? Assets.iconPlan3
                                                        : Assets.iconPlan4,
                                            width: 35,
                                            height: 35,
                                          )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (_con.shops[index].shapPhone !=
                                              null)
                                            InkWell(
                                              onTap: () async {
                                                await Launcher().makePhoneCall(
                                                    _con.shops[index].shapPhone
                                                        .toString());
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
                                                      _con.shops[index].shapPhone
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium
                                                          ?.copyWith(
                                                              height: 1.1,
                                                              fontSize: 15),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (_con.shops[index].shopEmail !=
                                              null)
                                            InkWell(
                                              onTap: () async {
                                                await Launcher().sendEmail(_con
                                                    .shops[index].shopEmail!);
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
                                                      _con.shops[index].shopEmail
                                                              ?.toString() ??
                                                          '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium
                                                          ?.copyWith(
                                                              height: 1.1,
                                                              fontSize: 15),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                        if (_con.shops[index].shopAddress != null)
                                          InkWell(
                                            onTap: () {
                                              if (_con.shops[index]
                                                  .shopAddressLat !=
                                                  null &&
                                                  _con.shops[index]
                                                      .shopAddressLon !=
                                                      null) {
                                                MapsSheet.show(
                                                    context: context,
                                                    latUser: _con.shops[index]
                                                        .shopAddressLat!,
                                                    longUser: _con
                                                        .shops[index]
                                                        .shopAddressLon!,
                                                    title: _con.shops[index]
                                                        .shopAddress!);
                                              }
                                            },
                                            child: SizedBox(
                                              height: 40,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons.location_on_rounded),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    _con.shops[index].shopAddress
                                                        ?.toString() ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium
                                                        ?.copyWith(
                                                        height: 1.1,
                                                        fontSize: 15),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.point_of_sale_rounded),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              _con.shops[index].shopPlan!=null ? 'عدد النقاط: ${ _con.shops[index].shopPlan}':
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                  height: 1.1,
                                                  fontSize: 15),
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
                    });
              } else {
                return const Center(
                  child: Text('لا يوجد محلات لعرضها'),
                );
              }
            }),
          ),
        ],
      )),
    );
  }
}
