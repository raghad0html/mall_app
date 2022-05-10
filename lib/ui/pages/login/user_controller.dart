import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/user/models/login_params_model.dart';
import '../../../main_sdk/apis/user/models/user_model.dart';
import '../../../main_sdk/apis/user/services/user_identity_apis.dart';
import '../../../routes.dart';
import '../../helper/helper.dart';

class UserController extends ControllerMVC {
  late GlobalKey<FormState> loginFormKey;
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late LoginParamsModel loginParamsModel;

  UserController() {
    loginFormKey = GlobalKey<FormState>();
    scaffoldKey = GlobalKey<ScaffoldState>();
    loginParamsModel = LoginParamsModel();
  }

  loginUser() async {
    if (loginFormKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();

      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);

      ResponseState<UserModel> _response =
          await UserIdentityApi().login(loginParamsModel: loginParamsModel);
      if (_response is SuccessState) {
        SuccessState<UserModel> user = _response as SuccessState<UserModel>;
        LocalStorageService().login = true;
        LocalStorageService().id = user.data.userId.toString();
        LocalStorageService().token = user.data.token;
        Helper.hideLoader(loader);
        Navigator.pushNamed(state!.context, Routes.homeScreen);
      } else if (_response is ErrorState) {
        ErrorState<UserModel> _res = _response as ErrorState<UserModel>;
        LocalStorageService().login = false;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }
}
