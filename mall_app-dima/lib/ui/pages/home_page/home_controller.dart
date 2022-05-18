import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';
import 'package:mall_app/main_sdk/apis/city/services/ciry_identity_apis.dart';
import 'package:mall_app/main_sdk/apis/game/services/game_identity_apis.dart';
import 'package:mall_app/main_sdk/apis/notification/models/notification_model.dart';
import 'package:mall_app/main_sdk/apis/notification/services/notification_identity_apis.dart';
import 'package:mall_app/routes.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/game/models/all_game_params_model.dart';
import '../../../main_sdk/apis/game/models/game_action_enums_model.dart';
import '../../../main_sdk/apis/game/models/game_model.dart';
import '../../../main_sdk/apis/game/models/game_params_model.dart';
import '../../../main_sdk/apis/mall/models/mall_action_enums_model.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';
import '../../../main_sdk/apis/mall/models/mall_params_model.dart';
import '../../../main_sdk/apis/mall/services/mall_identity_apis.dart';
import '../../../main_sdk/apis/notification/models/notification_params_model.dart';
import '../../helper/helper.dart';

class HomeController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late List<MallModel> malls = [];
  List<CityModel> cities = [];
  bool loading = false;
  bool loadingCompetition = false;
  String currentCity = '';
  List<GameModel> games = [];
  List<NotificationModel> notifications = [];
  bool loadingNotifications = false;
  HomeController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    currentCity = LocalStorageService().cityName ?? '';
  }

  getMalls() async {
    if (LocalStorageService().login ?? false) {
      loading = true;
      setState(() {});
      Future<ResponseState<ListOfMallModel>> _listOfMallModel =
          MallIdentityApi().getMalls(
              mallParamsModel: MallParamsModel(
                  token: LocalStorageService().token ?? '',
                  userid: LocalStorageService().id ?? '',
                  action: MallActionEnumsModel.getMallsByCity,
                  cityId: LocalStorageService().cityId ?? ''));
      ResponseState<ListOfMallModel> data = await _listOfMallModel;
      if (data is SuccessState) {
        SuccessState<ListOfMallModel> d = data as SuccessState<ListOfMallModel>;
        malls = d.data.data!;
        loading = false;
        setState(() {});
      }
    } else {
      Navigator.pushReplacementNamed(state!.context, Routes.loginScreen);
    }
  }

  getCity() async {
    Future<ResponseState<ListOfCityModel>> _listOfCities =
        CityIdentityApi().getCities();
    ResponseState<ListOfCityModel> data = await _listOfCities;
    if (data is SuccessState) {
      SuccessState<ListOfCityModel> d = data as SuccessState<ListOfCityModel>;
      cities = d.data.data!;
      setState(() {});
    }
  }

  saveCity(cityId, cityName) {
    currentCity = cityName;
    LocalStorageService().cityName = cityName;
    LocalStorageService().cityId = cityId.toString();
    setState(() {});
    getMalls();
  }

  createGame(int mallId, String mallName) async {
    var loader = Helper.overlayLoader(state!.context);
    FocusScope.of(state!.context).unfocus();
    Helper.overlayLoader(state!.context);
    Overlay.of(state!.context)?.insert(loader);

    GameParamsModel gameParamsModel = GameParamsModel(
      action: GameActionEnumsModel.createGame,
      mallId: mallId,
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
    );
    ResponseState<GameModel> _gameResponse =
        await GameIdentityApi().game(gameParamsModel: gameParamsModel);

    LocalStorageService().lastMallId = mallId.toString();
    if (_gameResponse is SuccessState) {
      SuccessState<GameModel> data = _gameResponse as SuccessState<GameModel>;
      GameModel gameModel = data.data;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(gameModel.msg ?? ''),
      ));
      LocalStorageService().lastGameId = gameModel.gameId.toString();
      LocalStorageService().lastMallId = mallId.toString();

      Helper.hideLoader(loader);
      Navigator.of(state!.context).pop();
      Navigator.pushNamed(state!.context, Routes.gameDetailScreen,
          arguments: GameDetails(
            mallName: mallName,
            gameId: gameModel.gameId ?? 0,
            mallId: mallId,
          ));
    }
    if (_gameResponse is ErrorState) {
      GameModel gameModel = _gameResponse as GameModel;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(gameModel.msg ?? ''),
      ));
      LocalStorageService().lastGameId = gameModel.gameId.toString();
      Helper.hideLoader(loader);
      Navigator.of(state!.context).pop();
      Navigator.pushNamed(state!.context, Routes.gameDetailScreen,
          arguments: GameDetails(
            mallName: mallName,
            gameId: gameModel.gameId ?? 0,
            mallId: mallId,
          ));
      LocalStorageService().lastMallId = mallId.toString();
    }
  }

  getAllGames() async {
    loadingCompetition = true;
    setState(() {});
    AllGameParamsModel allGameParamsModel = AllGameParamsModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
    );
    ResponseState<ListOfGameModel> _gameResponse = await GameIdentityApi()
        .getAllGame(allGameParamsModel: allGameParamsModel);

    if (_gameResponse is SuccessState) {
      SuccessState<ListOfGameModel> data =
          _gameResponse as SuccessState<ListOfGameModel>;

      games = data.data.data ?? [];
      // setState(() {});
    } else if (_gameResponse is ErrorState) {
      ErrorState<ListOfGameModel> data =
          _gameResponse as ErrorState<ListOfGameModel>;
    }
    loadingCompetition = false;
    setState(() {});
  }

  getAllNotification() async {
    if (LocalStorageService().login ?? false) {
      loadingNotifications = true;
      setState(() {});
      Future<ResponseState<ListOfNotificationModel>> _listOfNotifications =
          NotificationIdentityApi().getNotifications(
              notificationParamsModel: NotificationParamsModel(
                  token: LocalStorageService().token ?? '',
                  userid: LocalStorageService().id ?? '',
                  notificationId: '',
                  action: 'allNotifications'));
      ResponseState<ListOfNotificationModel> data = await _listOfNotifications;
      if (data is SuccessState) {
        SuccessState<ListOfNotificationModel> d =
            data as SuccessState<ListOfNotificationModel>;
        notifications = d.data.data!;
        loadingNotifications = false;
        setState(() {});
      }
    } else {
      Navigator.pushReplacementNamed(state!.context, Routes.loginScreen);
    }
  }

  changeNotificationStatus(NotificationModel _notificationModel) async {
    Future<ResponseState<NotificationModel>> _notification =
        NotificationIdentityApi().changeNotificationStatus(
            notificationParamsModel: NotificationParamsModel(
                token: LocalStorageService().token ?? '',
                userid: LocalStorageService().id ?? '',
                notificationId: '${_notificationModel.notificationId}',
                action: 'setSeen'));
    ResponseState<NotificationModel> data = await _notification;

    if (data is SuccessState) {
      SuccessState<NotificationModel> d =
          data as SuccessState<NotificationModel>;
      print('datadatadatadata ${d.data.notificationSeen}');
      getAllNotification();
    }
  }
}
