import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/ui/pages/game_detail/game_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../routes.dart';

class GameDetailScreen extends StatefulWidget {
  final GameDetails arguments;
  const GameDetailScreen({Key? key, required this.arguments}) : super(key: key);

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
    _con.getGameDetails(widget.arguments.mallId, widget.arguments.gameId,
        init: true);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _con.getGameDetails(widget.arguments.mallId, widget.arguments.gameId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const Icon(Icons.arrow_back_ios),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      Expanded(
                          child: Center(child: Text(widget.arguments.mallName)))
                    ],
                  ),
                  Text(
                    'بعض الكلمات التحفيزية وصورة ',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          if (_con.levelIndex == 0) {
                            if (_con.zero) {
                              await Navigator.pushNamed(
                                  context, Routes.invoiceQrScreen,
                                  arguments: InvoiceQrArguments(
                                    gameId: widget.arguments.gameId,
                                    mallId: widget.arguments.mallId,
                                    daily: true,
                                    title: S.of(context).dailyCompetitionTitle(
                                        widget.arguments.mallName),
                                  ));
                              _con.getGameDetails(widget.arguments.mallId,
                                  widget.arguments.gameId);
                            } else {
                              await Navigator.pushNamed(
                                  context, Routes.pontQrScreen,
                                  arguments: InvoiceQrArguments(
                                    gameId: widget.arguments.gameId,
                                    mallId: widget.arguments.mallId,
                                    daily: true,
                                    title: S.of(context).dailyCompetitionTitle(
                                        widget.arguments.mallName),
                                  ));
                              _con.getGameDetails(widget.arguments.mallId,
                                  widget.arguments.gameId);
                            }
                          }
                        },
                        child: GameLevelButton(
                          image: '24hourdaily.png',
                          locked: _con.levelIndex >= 0 ? false : true,
                          title: 'يومي',
                          completed: _con.levelIndex > 0 ? true : false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          if (_con.levelIndex == 1) {
                            await Navigator.pushNamed(
                                context, Routes.invoiceQrScreen,
                                arguments: InvoiceQrArguments(
                                  gameId: widget.arguments.gameId,
                                  mallId: widget.arguments.mallId,
                                  daily: true,
                                  title: 'Daily Game',
                                ));
                            _con.getGameDetails(widget.arguments.mallId,
                                widget.arguments.gameId);
                          }
                        },
                        child: GameLevelButton(
                          image: 'week.png',
                          locked: _con.levelIndex >= 1 ? false : true,
                          title: 'أسبوعي',
                          completed: _con.levelIndex > 1 ? true : false,
                        ),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Expanded(
                        child: InkWell(
                      onTap: () async {
                        if (_con.levelIndex == 2) {
                          await Navigator.pushNamed(
                              context, Routes.invoiceQrScreen,
                              arguments: InvoiceQrArguments(
                                gameId: widget.arguments.gameId,
                                mallId: widget.arguments.mallId,
                                daily: true,
                                title: 'Daily Game',
                              ));
                          _con.getGameDetails(
                              widget.arguments.mallId, widget.arguments.gameId);
                        }
                      },
                      child: GameLevelButton(
                        image: 'month.png',
                        locked: _con.levelIndex >= 2 ? false : true,
                        title: 'شهري',
                        completed: _con.levelIndex > 2 ? true : false,
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () async {
                        if (_con.levelIndex == 1) {
                          await Navigator.pushNamed(
                              context, Routes.invoiceQrScreen,
                              arguments: InvoiceQrArguments(
                                gameId: widget.arguments.gameId,
                                mallId: widget.arguments.mallId,
                                daily: true,
                                title: 'Daily Game',
                              ));
                          _con.getGameDetails(
                              widget.arguments.mallId, widget.arguments.gameId);
                        }
                      },
                      child: GameLevelButton(
                        image: 'week.png',
                        locked: _con.levelIndex >= 3 ? false : true,
                        completed: _con.levelIndex > 3 ? true : false,
                        title: 'ربع سنوي',
                      ),
                    )),
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}

class GameLevelButton extends StatelessWidget {
  final String image;
  final String title;
  final bool locked;
  final bool completed;

  const GameLevelButton(
      {Key? key,
      required this.title,
      required this.image,
      required this.locked,
      required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              if (locked)
                Image.asset(
                  'assets/images/$image',
                  color: Colors.white.withOpacity(0.4),
                  colorBlendMode: BlendMode.modulate,
                )
              else
                Image.asset(
                  'assets/images/$image',
                ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        if (locked)
          Image.asset(
            'assets/images/lock.png',
            width: 110,
          ),
        if (completed)
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
          ),
      ],
    );
  }
}
