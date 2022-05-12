import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/user/models/login_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/user_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class UserIdentityApi extends ApiModelIdentity {
  Future<ResponseState<UserModel>> login(
      {required LoginParamsModel loginParamsModel}) async {
    return apiMethod('user.php',
        data: loginParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => UserModel.fromJson(json));
  }
}
