import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/gift/models/gift_model.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../routes.dart';
import '../../widget/gift_item.dart';
import 'gifts_controller.dart';

// ignore: must_be_immutable
class GiftsForAllShopScreen extends StatefulWidget {
  GiftsForAllShopScreen({
    Key? key,
  }) : super(key: key);

  @override
  _GiftsForAllShopScreenState createState() => _GiftsForAllShopScreenState();
}

class _GiftsForAllShopScreenState extends StateMVC<GiftsForAllShopScreen> {
  late GiftsController _con;

  _GiftsForAllShopScreenState() : super(GiftsController()) {
    _con = controller as GiftsController;
  }

  @override
  void initState() {
    super.initState();
    _con.getGifts();
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
