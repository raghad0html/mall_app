import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';
import '../../main_sdk/apis/game/models/game_model.dart';
import '../../routes.dart';

class MyCompetitionItem extends StatelessWidget {
  const MyCompetitionItem({
    Key? key,
    required GameModel game,
    required this.gameLevel,
  })  : _game = game,
        super(key: key);

  final GameModel _game;
  final String gameLevel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.gameDetailScreen,
            arguments: GameDetails(
              mallName: _game.mallName ?? '',
              gameId: _game.gameId ?? 0,
              mallId: _game.mallId ?? 0,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.lightGrey.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '#${_game.gameId}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Text(
                  _game.gameDateStart ?? '',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            Text(
              '${gameLevel} - ${_game.mallName}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
