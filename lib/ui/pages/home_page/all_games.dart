import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
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
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CostumeAppBar(title: S.of(context).myCompetitions),
          const SizedBox(
            height: 20,
          ),
          _con.loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grayColor,
                          width: 1.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مول الامارات ',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const Text('Game Status'),
                          const Text('My points in daily game id 77'),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    ));
  }
}
