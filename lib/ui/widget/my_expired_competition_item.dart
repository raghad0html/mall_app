import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';
import '../../generated/l10n.dart';
import '../../main_sdk/apis/game/models/game_model.dart';

class MyExpiredCompetitionItem extends StatelessWidget {
  const MyExpiredCompetitionItem({
    Key? key,
    required GameModel game,
    required this.gameLevel,
  })  : _game = game,
        super(key: key);

  final GameModel _game;
  final String gameLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          formIntStatusToTextWidget(_game.gameStatus ?? '', context),
        ],
      ),
    );
  }

  Widget formIntStatusToTextWidget(String status, BuildContext context) {
    switch (status) {
      case '1':
        return Text(
          S.of(context).active,
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.deepOrangeAccent, fontWeight: FontWeight.w900),
        );

      case '2':
        return Text(
          S.of(context).googLuck,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.yellow, fontWeight: FontWeight.w900),
        );
      case '3':
        return Text(
          S.of(context).youAreTheWinner,
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.orangeAccent, fontWeight: FontWeight.w900),
        );
      default:
        return Text(
          '',
          style: Theme.of(context).textTheme.headline4,
        );
    }
  }
}
