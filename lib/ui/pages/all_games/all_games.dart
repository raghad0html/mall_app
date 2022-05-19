import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../main_sdk/apis/game/models/game_level_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../helper/helper.dart';
import '../../widget/my_competition_item.dart';
import '../../widget/my_expired_competition_item.dart';
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
    _con.getExpiredGames();
    _con.getActiveGames();
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
                            text: S.of(context).currentCpmpetitions,
                          ),
                          Tab(
                            text: S.of(context).endedCompetitions,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // create widgets for each tab bar here
                  Expanded(
                    child: TabBarView(
                      children: [
                        _con.loadingActive
                            ? const Center(child: CircularProgressIndicator())
                            : _con.games.isEmpty
                                ? Center(
                                    child: Text(
                                        S.of(context).noCurrentCompetitions))
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
                        _con.loadingExpired
                            ? const Center(child: CircularProgressIndicator())
                            : _con.endedGames.isEmpty
                                ? Center(
                                    child:
                                        Text(S.of(context).noEndedCompetitions))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _con.endedGames.length,
                                    itemBuilder: (context, i) {
                                      GameModel _game = _con.games[i];
                                      String gameLevel =
                                          Helper.getGameLevelFromEnum(
                                              _game.level ??
                                                  GameLevelEnumsModel.zero);
                                      return MyExpiredCompetitionItem(
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
