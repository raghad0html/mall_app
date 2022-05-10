import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';
import '../../widget/mall_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _con.getMalls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context)!.yourCity,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          S.of(context)!.riad,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          color:
                              AppColors.appBarBackGroundColor.withOpacity(0.2)),
                      child: Text(
                        S.of(context)!.myCompetitions,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
                decoration:
                    BoxDecoration(color: AppColors.appYellow.withOpacity(0.2)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context)!.beTheWinnerTitle,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            S.of(context)!.beTheWinnerMessage,
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
                                          _con.createGame(mall.mallId);
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
                                S.of(context)!.startACompetition,
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
              Text(
                S.of(context)!.malls,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              _con.malls.isEmpty && _con.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          itemCount: _con.malls.length,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, gridViewIndex) {
                            MallModel mall = _con.malls[gridViewIndex];
                            return MallWidget(mall: mall);
                          },
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
