import 'package:bloc_art_ct_aris/common/client/app_client.dart';
import 'package:bloc_art_ct_aris/common/client/api_paths.dart' as Constants;
import 'package:bloc_art_ct_aris/common/error/app_error.dart';
import 'package:bloc_art_ct_aris/common/result/result.dart';
import 'package:bloc_art_ct_aris/login/models/login_response.dart';
import 'package:bloc_art_ct_aris/login/models/out_put/login_out_put_model.dart';
import 'package:dio/dio.dart';

class LoginService {

  Future<Result<LoginData?>> login(String username, String password, int deviceType,
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
        var loginResponse = LoginResponse.fromJson(response.data);
        if (loginResponse.code == 0) {
          print('a2...........loginResponse.data?.token is:${loginResponse.data?.token}');
          return Result.success(data: loginResponse.data!);
        } else {
          // Login failed
          print('a2..............loginResponse.message is:${loginResponse.message}');
          return Result.failure(error: AppError(APIException(loginResponse.code!, loginResponse.message!)));
        }
      } else {
        // Handle error
        print('a2.........Error: ${response.statusCode} - ${response.data}');
        return Result.failure(error: AppError(APIException(response.statusCode!, 'loi chua xac dinh nha')));
      }
    } on Exception catch (e) {
      return Result.failure(error: AppError(e));
    }
  }
}

loi chua call dc nha