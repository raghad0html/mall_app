import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/routes.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/game/models/game_level_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';
import '../../helper/helper.dart';
import '../../widget/cities_drop_down_dialog.dart';
import '../../widget/lined_text.dart';
import '../../widget/mall_widget.dart';
import '../../widget/my_competition_item.dart';
import 'home_controller.dart';
import 'malls_drop_down_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomeController _con;

  _HomePageState() : super(HomeController()) {
    _con = controller as HomeController;
  }

  int? cityId;
  @override
  void initState() {
    super.initState();
    _con.getMalls();
    _con.getCity();
    _con.getAllGames();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _con.scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CitiesDropDownDialog(
                              cities: _con.cities,
                              selectedCity: (mall) {
                                cityId = mall.cityId;
                                Navigator.pop(context);
                                _con.saveCity(mall.cityId, mall.cityName);
                              });
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: AppColors.grayColor.withOpacity(0.2)),
                      child: Text(
                        _con.currentCity,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color:
                              AppColors.appBarBackGroundColor.withOpacity(0.2)),
                      child: Text(
                        'حسابي',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  // IconButton(onPressed: (){
                  //   Navigator.pushNamed(context, Routes.profileScreen);
                  // }, icon:const  Icon(Icons.account_circle ,size: 35,))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.appYellow.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).beTheWinnerTitle,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            S.of(context).beTheWinnerMessage,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (_con.malls.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MallsDropDownDialog(
                                        malls: _con.malls,
                                        selectedMall: (mall) {
                                          _con.createGame(
                                              mall.mallId, mall.name ?? '');
                                        });
                                  },
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: AppColors.appOrange.withOpacity(0.2)),
                              child: Text(
                                S.of(context).startACompetition,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Lottie.asset('assets/lottie/winner.json')),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.allGamesScreen);
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    S.of(context).myCompetitions,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                const LinedText(
                                  color: AppColors.basicColor,
                                  text: 'عرض الكل',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            child: _con.games.isEmpty && _con.loadingCompetition
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount: _con.games.length,
                                    shrinkWrap: true,
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).malls,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_con.malls.isNotEmpty && !_con.loading) {
                                Navigator.pushNamed(context, Routes.mallsScreen,
                                    arguments: cityId ??
                                        int.tryParse(
                                            LocalStorageService().cityId!));
                              }
                            },
                            child: const LinedText(
                              color: AppColors.basicColor,
                              text: 'عرض الكل',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _con.malls.isEmpty && _con.loading
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.builder(
                              itemCount: _con.malls.length,
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, gridViewIndex) {
                                MallModel mall = _con.malls[gridViewIndex];
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.shopsScreen,
                                          arguments: ShopArguments(
                                              mallName: _con
                                                      .malls[gridViewIndex]
                                                      .name ??
                                                  '',
                                              mallId: _con.malls[gridViewIndex]
                                                  .mallId));
                                    },
                                    child: MallWidget(mall: mall));
                              },
                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
