import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../main_sdk/apis/game/models/game_level_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../helper/helper.dart';
import '../../widget/my_competition_item.dart';
import '../game_detail/game_controller.dart';

class AllGamesScreen extends StatefulWidget {
  const AllGamesScreen({Key? key}) : super(key: key);

  @override
  _AllGamesScreenState createState() => _AllGamesScreenState();
}

class _AllGamesScreenState extends StateMVC<AllGamesScreen> {
  late GameController _con;

  _AllGamesScreenState() : super(GameController()) {
    _con = controller as GameController;
  }

  @override
  void initState() {
    super.initState();
    _con.getAllGames();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            CostumeAppBar(title: S.of(context).myCompetitions),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      bottom: TabBar(
                        tabs: [
                          Tab(
                            text: 'مسابقات جارية',
                          ),
                          Tab(
                            text: 'مسابقات منتهية',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // create widgets for each tab bar here
                  Expanded(
                    child: TabBarView(
                      children: [
                        _con.loading
                            ? const Center(child: CircularProgressIndicator())
                            : _con.games.isEmpty
                                ? Center(child: Text('لا يوجد مسابقات جارية'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _con.games.length,
                                    itemBuilder: (context, i) {
                                      GameModel _game = _con.games[i];
                                      String gameLevel =
                                          Helper.getGameLevelFromEnum(
                                              _game.level ??
                                                  GameLevelEnumsModel.zero);
                                      return MyCompetitionItem(
                                          game: _game, gameLevel: gameLevel);
                                    },
                                  ),
                        _con.loading
                            ? const Center(child: CircularProgressIndicator())
                            : _con.endedGames.isEmpty
                                ? Center(child: Text('لا يوجد مسابقات منتهية'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _con.endedGames.length,
                                    itemBuilder: (context, i) {
                                      GameModel _game = _con.games[i];
                                      String gameLevel =
                                          Helper.getGameLevelFromEnum(
                                              _game.level ??
                                                  GameLevelEnumsModel.zero);
                                      return MyCompetitionItem(
                                          game: _game, gameLevel: gameLevel);
                                    },
                                  ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
