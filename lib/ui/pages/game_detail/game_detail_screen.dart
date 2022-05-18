import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/ui/pages/game_detail/game_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../routes.dart';
import '../../widget/costume_appbar.dart';
import '../../widget/game_level_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        body: SafeArea(
          child: Column(
            children: [
              CostumeAppBar(title: widget.arguments.mallName),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: SingleChildScrollView(
                    child: _con.loadingDetails
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S
                                        .of(context)
                                        .chooseLevelToContinueTheCompetition,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.info_outline,
                                      color: AppColors.lightGrey),
                                ],
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
                                                mallName:
                                                    widget.arguments.mallName,
                                                gameId: widget.arguments.gameId,
                                                mallId: widget.arguments.mallId,
                                                billAmount: _con.billAmount,
                                                currency: _con.currency,
                                                daily: true,
                                                title: S
                                                    .of(context)
                                                    .dailyCompetitionTitle(
                                                        widget.arguments
                                                            .mallName),
                                              ));
                                          _con.getGameDetails(
                                              widget.arguments.mallId,
                                              widget.arguments.gameId);
                                        } else {
                                          await Navigator.pushNamed(
                                              context, Routes.pontQrScreen,
                                              arguments: InvoiceQrArguments(
                                                mallName:
                                                    widget.arguments.mallName,
                                                gameId: widget.arguments.gameId,
                                                mallId: widget.arguments.mallId,
                                                balancePoints:
                                                    _con.balancePoints,
                                                targetPoints: _con.targetPoint,
                                                billAmount: _con.billAmount,
                                                currency: _con.currency,
                                                daily: true,
                                                title: S
                                                    .of(context)
                                                    .dailyCompetitionTitle(
                                                        widget.arguments
                                                            .mallName),
                                              ));
                                          _con.getGameDetails(
                                              widget.arguments.mallId,
                                              widget.arguments.gameId);
                                        }
                                      }
                                    },
                                    child: GameLevelButton(
                                      image: '24hourdaily.png',
                                      locked:
                                          _con.levelIndex >= 0 ? false : true,
                                      title: S.of(context).daily,
                                      completed:
                                          _con.levelIndex > 0 ? true : false,
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
                                              mallName:
                                                  widget.arguments.mallName,
                                              billAmount: _con.billAmount,
                                              currency: _con.currency,
                                              daily: true,
                                              title: S
                                                  .of(context)
                                                  .weeklyCompetition,
                                            ));
                                        _con.getGameDetails(
                                            widget.arguments.mallId,
                                            widget.arguments.gameId);
                                      }
                                    },
                                    child: GameLevelButton(
                                      image: 'week.png',
                                      locked:
                                          _con.levelIndex >= 1 ? false : true,
                                      title: S.of(context).weekly,
                                      completed:
                                          _con.levelIndex > 1 ? true : false,
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
                                            mallName: widget.arguments.mallName,
                                            billAmount: _con.billAmount,
                                            currency: _con.currency,
                                            daily: true,
                                            title: S
                                                .of(context)
                                                .monthlyCompetition,
                                          ));
                                      _con.getGameDetails(
                                          widget.arguments.mallId,
                                          widget.arguments.gameId);
                                    }
                                  },
                                  child: GameLevelButton(
                                    image: 'month.png',
                                    locked: _con.levelIndex >= 2 ? false : true,
                                    title: S.of(context).monthly,
                                    completed:
                                        _con.levelIndex > 2 ? true : false,
                                  ),
                                )),
                                Expanded(
                                    child: InkWell(
                                  onTap: () async {
                                    if (_con.levelIndex == 3) {
                                      await Navigator.pushNamed(
                                          context, Routes.invoiceQrScreen,
                                          arguments: InvoiceQrArguments(
                                            gameId: widget.arguments.gameId,
                                            mallId: widget.arguments.mallId,
                                            mallName: widget.arguments.mallName,
                                            billAmount: _con.billAmount,
                                            currency: _con.currency,
                                            daily: true,
                                            title: S
                                                .of(context)
                                                .QuarterManualCompetition,
                                          ));
                                      _con.getGameDetails(
                                          widget.arguments.mallId,
                                          widget.arguments.gameId);
                                    }
                                  },
                                  child: GameLevelButton(
                                    image: '90.png',
                                    locked: _con.levelIndex >= 3 ? false : true,
                                    completed:
                                        _con.levelIndex > 3 ? true : false,
                                    title: S.of(context).QuarterManual,
                                  ),
                                )),
                              ]),
                              const SizedBox(height: 10),
                              Text(
                                _con.message ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
