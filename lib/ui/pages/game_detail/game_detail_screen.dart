import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/game_detail/game_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class GameDetailScreen extends StatefulWidget {
  const GameDetailScreen({Key? key}) : super(key: key);

  @override
  _GameDetailScreenState createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends StateMVC<GameDetailScreen> {
  late GameController _con;

  _GameDetailScreenState() : super(GameController()) {
    _con = controller as GameController;
  }

  @override
  void initState() {
    super.initState();
    _con.getGameDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Text(
              'بعض الكلمات التحفيزية وصورة ',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () async {},
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/24hourdaily.png'),
                            Text(
                              'يومي',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {},
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/24hourdaily.png'),
                            Text(
                              'يومي',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
            Row()
          ],
        ));
  }
}
