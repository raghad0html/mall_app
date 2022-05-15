import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/mall_page/shop_page/shop_controller.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
          _con.shops.isEmpty && _con.loading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: Builder(builder: (context) {
                    if (_con.shops.isEmpty && _con.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (_con.shops.isNotEmpty) {
                      return ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _con.shops.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.shopDetailsScreen,
                                    arguments: ShopArguments(
                                        mallName:
                                            _con.shops[index].shopName ?? '',
                                        mallId: _con.shops[index].shopId!,
                                        image: _con.shops[index].picture));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: CachedNetworkImage(
                                        height: 170,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                          child: CircularProgressIndicator(
                                            value: progress.progress,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error_outline),
                                        imageUrl:
                                            _con.shops[index].picture ?? '',
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
                                            _con.shops[index].shopName ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(height: 1.1),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (_con.shops[index]
                                                        .shopEmail !=
                                                    null)
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.call),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        _con.shops[index]
                                                                .shopEmail ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium
                                                            ?.copyWith(
                                                                height: 1.1,
                                                                fontSize: 15),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                if (_con.shops[index]
                                                        .shapPhone !=
                                                    null)
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.email),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        _con.shops[index]
                                                                .shapPhone
                                                                ?.toString() ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium
                                                            ?.copyWith(
                                                                height: 1.1,
                                                                fontSize: 15),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_con.shops[index].shopAddress !=
                                              null)
                                            Row(
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
