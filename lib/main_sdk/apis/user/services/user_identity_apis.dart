import 'package:mall_app/main_sdk/apis/core/models/common/message_model.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/user/models/login_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/profile_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/register_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/delete_account_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/resend_code_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/resend_delete_code_email_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/set_new_password_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/update_profile_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/user_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/verify_code_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/verify_delete_code_params_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class UserIdentityApi extends ApiModelIdentity {
  Future<ResponseState<UserModel>> login(
      {required LoginParamsModel loginParamsModel}) async {
    return apiMethod('login.php',
        data: loginParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => UserModel.fromJson(json));
  }

  Future<ResponseState<UserModel>> profile(
      {required ProfileParamsModel profileParamsModel}) async {
    return apiMethod('profile.php',
        data: profileParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => UserModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> register(
      {required RegisterParamsModel registerParamsModel}) async {
    return apiMethod('register.php',
        data: registerParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> updateProfile(
      {required UpdateProfileParamsModel updateProfileParamsModel}) async {
    return apiMethod('profile.php',
        data: updateProfileParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> resetPassword(
      {required RegisterParamsModel registerParamsModel}) async {
    return apiMethod('reset_password.php',
        data: registerParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> resendCodePassword(
      {required ResendCodeParamsModel resendCodeParamsModel}) async {
    return apiMethod('resend_code_email.php',
        data: resendCodeParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> verifyCodePassword(
      {required VerifyCodeParamsModel verifyCodeParamsModel}) async {
    return apiMethod('verify_code.php',
        data: verifyCodeParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> setNewPassword(
      {required SetNewPasswordParamsModel setNewPasswordParamsModel}) async {
    return apiMethod('set_new_password.php',
        data: setNewPasswordParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> deleteAccount(
      {required DeleteAccountParamsModel deleteAccountParamsModel}) async {
    return apiMethod('delete_account.php',
        data: deleteAccountParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> resendDeleteCodeEmail(
      {required ResendDeleteCodeEmailModel resendDeleteCodeEmailModel}) async {
    return apiMethod('resend_delete_code_email.php',
        data: resendDeleteCodeEmailModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }

  Future<ResponseState<MessageModel>> verifyDeleteCode(
      {required VerifyDeleteCodeParamsModel
          verifyDeleteCodeParamsModel}) async {
    return apiMethod('verify_delete_code.php',
        data: verifyDeleteCodeParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => MessageModel.fromJson(json));
  }
}
