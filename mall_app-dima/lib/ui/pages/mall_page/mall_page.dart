import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/mall_page/mall_controller.dart';
import 'package:mall_app/ui/widget/mall_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MallsPage extends StatefulWidget {
  final int city;

  const MallsPage({Key? key, required this.city}) : super(key: key);

  @override
  _MallsPageState createState() => _MallsPageState();
}

class _MallsPageState extends StateMVC<MallsPage> {
  late MallController _con;

  _MallsPageState() : super(MallController()) {
    _con = controller as MallController;
  }

  @override
  void initState() {
    super.initState();
    _con.getMalls(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(
            S.of(context).malls,
          ),
        ),
        body: Builder(builder: (context) {
          if (_con.malls.isEmpty && _con.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (_con.malls.isNotEmpty) {
            return GridView.builder(
              itemCount: _con.malls.length,
              shrinkWrap: true,
              primary: false,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, gridViewIndex) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.shopsScreen,
                          arguments: ShopArguments(
                              mallName: _con.malls[gridViewIndex].name ?? '',
                              mallId: _con.malls[gridViewIndex].mallId));
                    },
                    child: MallWidget(mall: _con.malls[gridViewIndex]));
              },
            );
          } else {
            return Center(
              child: Text(S.of(context).noMalls),
            );
          }
        }));
  }
}
