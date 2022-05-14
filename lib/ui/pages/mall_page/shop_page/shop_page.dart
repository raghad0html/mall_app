import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/mall_page/shop_page/shop_controller.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          widget.shopArguments.mallName,
        ),
      ),
      body: _con.shops.isEmpty && _con.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
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
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline),
                          imageUrl: _con.shops[index].picture ?? '',
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _con.shops[index].shopName ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(height: 1.1),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                _con.shops[index].shopEmail ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(height: 1.1, fontSize: 13),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
