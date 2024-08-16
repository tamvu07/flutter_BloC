import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/SharedPreferences/SaveToken.dart';
import 'package:demo_cubit_bloc/model/loginInPutModel.dart';
import 'package:demo_cubit_bloc/model/loginOutPutModel.dart';
import 'package:demo_cubit_bloc/model/model_converter.dart';

part 'theta_service.chopper.dart';

@ChopperApi()
abstract class ThetaService extends ChopperService  {

  @Post(
    path: 'authen/v1/api/auth/client',
  )
  Future<Response<Result<LoginOutPutModel>>> login(@Body() LoginInPutModel loginModel);

@Get(
    path: 'iot-service/v1/api/things/thing/84:86:f3:00:29:0b?is_simple=true',
    )
  Future<Response<dynamic>> urgencySetting();

  static ThetaService create(ModelsResponseType modelServiceType) {
    final client = ChopperClient(

      baseUrl: Uri.tryParse('https://api.onskycloud.com'),
      
      converter: ModelConverter(modelType: modelServiceType),

      services: [
        _$ThetaService(),
      ],
    );
    return _$ThetaService(client);
  }
}


// @override
//   Future<Response<dynamic>> urgencySetting() async {
//     final authToken = await SaveToken.getToken();
//     final Uri $url = Uri.parse(
//         'iot-service/v1/api/things/thing/84:86:f3:00:29:0b?is_simple=true');
//     final Request $request = Request(
//       'GET',
//       $url,
//       client.baseUrl,
//        headers: {'Authorization': 'Bearer $authToken'},
//     );
//     return client.send<dynamic, dynamic>($request);
//   }