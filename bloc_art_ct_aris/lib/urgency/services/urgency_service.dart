
import 'package:bloc_art_ct_aris/common/client/app_client.dart';
import 'package:bloc_art_ct_aris/common/error/app_error.dart';
import 'package:bloc_art_ct_aris/common/result/result.dart';
import 'package:bloc_art_ct_aris/common/client/api_paths.dart' as Constants;
import 'package:bloc_art_ct_aris/urgency/models/urgencyOutPutModel/urgencyOutPutModel.dart';

class UrgencyService {

  Future<Result<UrgencyOutPutModel?>> getUrgency() async {
    try {
      var client = await AppClient.getInstance();
      var response = await client.get(Constants.urgencyService);
      if (response.statusCode == 200) {
        var loginResponse = UrgencyOutPutModel.fromJson(response.data);
          return Result.success(data: loginResponse);
      } else {
        return Result.failure(error: AppError(APIException(response.statusCode!, 'loi chua xac dinh nha')));
      }
    } on Exception catch (e) {
      return Result.failure(error: AppError(e));
    }
  }
}