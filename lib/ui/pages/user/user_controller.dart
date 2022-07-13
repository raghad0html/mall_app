import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';
import 'package:mall_app/main_sdk/apis/city/services/ciry_identity_apis.dart';
import 'package:mall_app/main_sdk/apis/user/models/profile_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/register_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/delete_account_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/resend_code_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/resend_delete_code_email_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/set_new_password_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/update_profile_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/verify_code_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/verify_delete_code_params_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/message_model.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/user/models/login_params_model.dart';
import '../../../main_sdk/apis/user/models/user_model.dart';
import '../../../main_sdk/apis/user/services/user_identity_apis.dart';
import '../../../routes.dart';
import '../../helper/helper.dart';

class UserController extends ControllerMVC {
  late GlobalKey<FormState> formKey;
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  late LoginParamsModel loginParamsModel;
  late RegisterParamsModel registerParamsModel;
  List<CityModel> cities = [];
  late CityModel city;
  bool clickable = true;
  int timer = 0;
  bool loading = false;
  UserModel? userModel;
  String msg = "";

  UserController() {
    formKey = GlobalKey<FormState>();
    scaffoldKey = GlobalKey<ScaffoldState>();
    loginParamsModel = LoginParamsModel();
    registerParamsModel = RegisterParamsModel();
  }

  getCity() async {
    Future<ResponseState<ListOfCityModel>> _listOfCities =
        CityIdentityApi().getCities();
    ResponseState<ListOfCityModel> data = await _listOfCities;
    if (data is SuccessState) {
      SuccessState<ListOfCityModel> d = data as SuccessState<ListOfCityModel>;
      cities = d.data.data!;
      city = cities.first;
      setState(() {});
    }
  }

  loginUser() async {
    if (formKey.currentState!.validate()) {
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
        LocalStorageService().cityId = user.data.cityId.toString();
        LocalStorageService().email = user.data.email.toString();
        LocalStorageService().cityName = user.data.cityName;
        Helper.hideLoader(loader);
        Navigator.pushNamed(state!.context, Routes.homeScreen);
      } else if (_response is ErrorState) {
        ErrorState<UserModel> _res = _response as ErrorState<UserModel>;
        LocalStorageService().login = false;
        debugPrint(_res.errorMessage.error!.message);
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }

  registerNewUser() async {
    if (formKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);

      ResponseState<MessageModel> _response = await UserIdentityApi()
          .register(registerParamsModel: registerParamsModel);
      if (_response is SuccessState) {
        SuccessState<MessageModel> _res =
            _response as SuccessState<MessageModel>;
        Helper.hideLoader(loader);
        if (_res.data.registerAccepted ?? true) {
          Navigator.pushReplacementNamed(state!.context, Routes.loginScreen,
              arguments: BoolArguments(fromLogout: false));
        }
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.data.msg ?? ''),
        ));
      } else if (_response is ErrorState) {
        ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
        LocalStorageService().login = false;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }

  updateProfile(
      {required UpdateProfileParamsModel updateProfileParamsModel}) async {
    if (formKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);

      ResponseState<MessageModel> _response = await UserIdentityApi()
          .updateProfile(updateProfileParamsModel: updateProfileParamsModel);
      if (_response is SuccessState) {
        SuccessState<MessageModel> _res =
            _response as SuccessState<MessageModel>;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.data.msg ?? ''),
        ));
      } else if (_response is ErrorState) {
        ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }

  sendCodeToEmail(String email) async {
    if (formKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);
      RegisterParamsModel registerParamsModel =
          RegisterParamsModel(email: email);
      ResponseState<MessageModel> _response = await UserIdentityApi()
          .resetPassword(registerParamsModel: registerParamsModel);

      if (_response is SuccessState) {
        SuccessState<MessageModel> _res =
            _response as SuccessState<MessageModel>;
        Helper.hideLoader(loader);

        if (_res.data.resetAccepted ?? true) {
          Navigator.pushNamed(state!.context, Routes.checkCodeScreen,
              arguments: StringArguments(email: email));

          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
        } else {
          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
        }
      } else if (_response is ErrorState) {
        ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
        LocalStorageService().login = false;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }

  checkCode(String email, String code) async {
    if (formKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);
      VerifyCodeParamsModel verifyCodeParamsModel =
          VerifyCodeParamsModel(email: email, code: code);
      ResponseState<MessageModel> _response = await UserIdentityApi()
          .verifyCodePassword(verifyCodeParamsModel: verifyCodeParamsModel);

      if (_response is SuccessState) {
        SuccessState<MessageModel> _res =
            _response as SuccessState<MessageModel>;
        Helper.hideLoader(loader);

        if (_res.data.codeAccepted ?? true) {
          Navigator.pushNamed(state!.context, Routes.resetPasswordScreen,
              arguments: StringArguments(email: email, code: code));
          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
        } else {
          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
        }
      } else if (_response is ErrorState) {
        ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
        LocalStorageService().login = false;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }

  setNewPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    if (formKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);
      SetNewPasswordParamsModel setNewPasswordParamsModel =
          SetNewPasswordParamsModel(
              email: email, password: newPassword, code: code);
      ResponseState<MessageModel> _response = await UserIdentityApi()
          .setNewPassword(setNewPasswordParamsModel: setNewPasswordParamsModel);

      if (_response is SuccessState) {
        SuccessState<MessageModel> _res =
            _response as SuccessState<MessageModel>;
        Helper.hideLoader(loader);

        if (_res.data.newPasswordAccepted ?? true) {
          Navigator.pushReplacementNamed(state!.context, Routes.loginScreen,
              arguments: BoolArguments(fromLogout: false));
          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
        } else {
          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
        }
      } else if (_response is ErrorState) {
        ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
        LocalStorageService().login = false;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
      }
    }
  }

  resendCode(String email) async {
    var loader = Helper.overlayLoader(state!.context);
    FocusScope.of(state!.context).unfocus();
    Helper.overlayLoader(state!.context);
    Overlay.of(state!.context)?.insert(loader);
    ResendCodeParamsModel resendCodeParamsModel = ResendCodeParamsModel(
      email: email,
    );
    ResponseState<MessageModel> _response = await UserIdentityApi()
        .resendCodePassword(resendCodeParamsModel: resendCodeParamsModel);

    if (_response is SuccessState) {
      SuccessState<MessageModel> _res = _response as SuccessState<MessageModel>;
      Helper.hideLoader(loader);

      if (_res.data.resendAccepted ?? true) {
        setTimer();
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.data.msg ?? ''),
        ));
      } else {
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.data.msg ?? ''),
        ));
      }
    } else if (_response is ErrorState) {
      ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
      LocalStorageService().login = false;
      Helper.hideLoader(loader);
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(_res.errorMessage.error!.message),
      ));
    }
  }

  void setTimer() {
    Timer _timer;
    int _start = 60;
    timer = 60;
    clickable = false;
    setState(() {});
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer1) {
        if (_start == 0) {
          setState(() {
            timer1.cancel();
            clickable = true;
          });
        } else {
          setState(() {
            _start--;
            timer = _start;
          });
        }
      },
    );
  }

  getUserData() async {
    loading = true;
    setState(() {});
    Future<ResponseState<UserModel>> _user = UserIdentityApi().profile(
        profileParamsModel: ProfileParamsModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
    ));
    ResponseState<UserModel> data = await _user;
    if (data is SuccessState) {
      SuccessState<UserModel> d = data as SuccessState<UserModel>;
      userModel = d.data;
      loading = false;
      setState(() {});
    }
  }

  deleteAccount() async {
    DeleteAccountParamsModel deleteAccountParamsModel =
        DeleteAccountParamsModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      email: LocalStorageService().email ?? '',
      //email: email,
    );
    ResponseState<MessageModel> _response = await UserIdentityApi()
        .deleteAccount(deleteAccountParamsModel: deleteAccountParamsModel);
    if (_response is SuccessState) {
      SuccessState<MessageModel> _res = _response as SuccessState<MessageModel>;
      msg = _res.data.msg ?? '';
      /*
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(_res.data.msg ?? ''),
      ));
      */

    } else if (_response is ErrorState) {
      ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(_res.errorMessage.error!.message),
      ));
      msg = _res.errorMessage.error!.message;
    }
  }

  resendDeleteCode() async {
    ResendDeleteCodeEmailModel resendDeleteCodeEmailModel =
        ResendDeleteCodeEmailModel(
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      email: LocalStorageService().email ?? '',
    );
    ResponseState<MessageModel> _response = await UserIdentityApi()
        .resendDeleteCodeEmail(
            resendDeleteCodeEmailModel: resendDeleteCodeEmailModel);
    if (_response is SuccessState) {
      SuccessState<MessageModel> _res = _response as SuccessState<MessageModel>;
      msg = _res.data.msg ?? '';
      /*
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(_res.data.msg ?? ''),
      ));
      */
    } else if (_response is ErrorState) {
      ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(_res.errorMessage.error!.message),
      ));
      msg = _res.errorMessage.error!.message;
    }
  }

  verifyDeleteCode(String code) async {
    if (formKey.currentState!.validate()) {
      var loader = Helper.overlayLoader(state!.context);
      FocusScope.of(state!.context).unfocus();
      Helper.overlayLoader(state!.context);
      Overlay.of(state!.context)?.insert(loader);
      VerifyDeleteCodeParamsModel verifyDeleteCodeParamsModel =
          VerifyDeleteCodeParamsModel(
              token: LocalStorageService().token ?? '',
              userid: LocalStorageService().id ?? '',
              email: LocalStorageService().email ?? '',
              code: code);
      ResponseState<MessageModel> _response = await UserIdentityApi()
          .verifyDeleteCode(
              verifyDeleteCodeParamsModel: verifyDeleteCodeParamsModel);

      if (_response is SuccessState) {
        SuccessState<MessageModel> _res =
            _response as SuccessState<MessageModel>;
        Helper.hideLoader(loader);

        if (_res.data.codeAccepted ?? true) {
          LocalStorageService().logOut();
          Navigator.pushNamed(state!.context, Routes.loginScreen);
          ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
            content: Text(_res.data.msg ?? ''),
          ));
          msg = _res.data.msg ?? '';
        } else {
          msg = _res.data.msg ?? '';
          /*
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
        content: Text(_res.data.msg ?? ''),
      ));
      */

        }
      } else if (_response is ErrorState) {
        ErrorState<MessageModel> _res = _response as ErrorState<MessageModel>;
        Helper.hideLoader(loader);
        ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(_res.errorMessage.error!.message),
        ));
        msg = _res.errorMessage.error!.message;
      }
    }
  }
}
