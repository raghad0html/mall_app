import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/gift/models/gift_model.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../routes.dart';
import '../../widget/gift_item.dart';
import 'gifts_controller.dart';

class GiftsForShopScreen extends StatefulWidget {
  ShopArguments arguments;
  GiftsForShopScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  _GiftsForShopScreenState createState() => _GiftsForShopScreenState();
}

class _GiftsForShopScreenState extends StateMVC<GiftsForShopScreen> {
  late GiftsController _con;

  _GiftsForShopScreenState() : super(GiftsController()) {
    _con = controller as GiftsController;
  }

  @override
  void initState() {
    super.initState();
    _con.getGifts(widget.arguments.mallId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _con.scaffoldKey,
        body: Column(
          children: [
            CostumeAppBar(title: S.of(context).gifts),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  itemCount: _con.gifts.length,
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, gridViewIndex) {
                    GiftModel _gift = _con.gifts[gridViewIndex];
                    return GiftItem(
                      gift: _gift,
                      fromGrid: true,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
