import 'package:flutter/material.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/share_shop_page/share_shop_controller.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mall_app/ui/widget/shop_item.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../generated/l10n.dart';
import '../../../main_sdk/apis/shop/models/shop_model.dart';

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
                        ShopModel _shop = _con.shops[index];
                        return ShopItem(
                          shop: _shop,
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
        ),
      ),
    );
  }
}
