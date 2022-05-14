import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/mall_page/shop_page/shop_details_page/shop_details_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(widget.shopArguments.mallName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
              imageUrl: widget.shopArguments.image ?? '',
            ),
            const SizedBox(
              height: 15,
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
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              height: 130,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error_outline),
                              imageUrl:
                                  _con.products[gridViewIndex].picture ?? '',
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.bottomRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _con.products[gridViewIndex].name ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(height: 1.1),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    _con.products[gridViewIndex].price
                                            ?.toString() ??
                                        '',
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
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
