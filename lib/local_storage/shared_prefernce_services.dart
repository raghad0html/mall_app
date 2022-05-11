import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static late final SharedPreferences _preferences;

  final String _firstTimeLogged = "firstTimeLogged";

  final String isLogin = "isLogin";
  final String userToken = "token";
  final String userId = "userId";
  final String _email = "email";
  final String _password = "password";
  final String gameId = "gameId";
  final String mallId = "mallId";
  final String _cityId = "cityId";
  final String _cityName = "cityName";

  static Future<void> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
  }

  bool? get firstTimeLogged => _preferences.getBool(_firstTimeLogged);

  bool? get login => _preferences.getBool(isLogin);

  String? get token => _preferences.getString(userToken);

  String? get lastGameId => _preferences.getString(gameId);

  String? get lastMallId => _preferences.getString(mallId);

  String? get id => _preferences.getString(userId);

  String? get cityId => _preferences.getString(_cityId);

  String? get cityName => _preferences.getString(_cityName);

  String? get email => _preferences.getString(_email);

  String? get password => _preferences.getString(_password);

  set login(bool? value) {
    if (value == null) {
      _preferences.remove(isLogin);
      return;
    }
    _preferences.setBool(isLogin, value);
  }

  set token(String? value) {
    if (value == null) {
      _preferences.remove(userToken);
      return;
    }
    _preferences.setString(userToken, value);
  }

  set lastGameId(String? value) {
    if (value == null) {
      _preferences.remove(gameId);
      return;
    }
    _preferences.setString(gameId, value);
  }

  set lastMallId(String? value) {
    if (value == null) {
      _preferences.remove(mallId);
      return;
    }
    _preferences.setString(mallId, value);
  }

  set cityId(String? value) {
    if (value == null) {
      _preferences.remove(_cityId);
      return;
    }
    _preferences.setString(_cityId, value);
  }

  set cityName(String? value) {
    if (value == null) {
      _preferences.remove(_cityName);
      return;
    }
    _preferences.setString(_cityName, value);
  }

  set id(String? value) {
    if (value == null) {
      _preferences.remove(userId);
      return;
    }
    _preferences.setString(userId, value);
  }

  set firstTimeLogged(bool? value) {
    if (value == null) {
      _preferences.remove(_firstTimeLogged);
      return;
    }
    _preferences.setBool(_firstTimeLogged, value);
  }

  set email(String? value) {
    if (value == null) {
      _preferences.remove(_email);
      return;
    }
    _preferences.setString(_email, value);
  }

  set password(String? value) {
    if (value == null) {
      _preferences.remove(_password);
      return;
    }
    _preferences.setString(_password, value);
  }

  logOut() {
    _preferences.remove(_password);
    _preferences.remove(_email);
    _preferences.remove(isLogin);
  }
}
