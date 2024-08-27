import 'package:bloc_art_ct_aris/SharedPreferences/SaveToken.dart';
import 'package:bloc_art_ct_aris/common/client/app_client.dart';
import 'package:bloc_art_ct_aris/common/client/api_paths.dart' as Constants;
import 'package:bloc_art_ct_aris/common/error/app_error.dart';
import 'package:bloc_art_ct_aris/common/result/result.dart';
import 'package:bloc_art_ct_aris/login/models/login_response.dart';
import 'package:bloc_art_ct_aris/login/models/out_put/login_out_put_model.dart';
import 'package:dio/dio.dart';

class LoginService {

  Future<Result<LoginOutPutModel?>> login(String username, String password, int deviceType,
      String deviceToken) async {
    try {
      var param = FormData.fromMap({
        'username': username,
        'password': password,
        'device_type': deviceType,
        'device_token': deviceToken
      });
      var client = await AppClient.getInstance();
      var response = await client.post(Constants.login, data: param);
      if (response.statusCode == 200) {
        var loginResponse = LoginOutPutModel.fromJson(response.data);
        var token = loginResponse.token;
        SaveToken.saveToken(token);
          return Result.success(data: loginResponse);
      } else {
        return Result.failure(error: AppError(APIException(response.statusCode!, 'loi chua xac dinh nha')));
      }
    } on Exception catch (e) {
      return Result.failure(error: AppError(e));
    }
  }
}
