import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/model/loginInPutModel.dart';
import 'package:demo_cubit_bloc/model/loginOutPutModel.dart';
import 'package:demo_cubit_bloc/model/model_converter.dart';

part 'theta_service.chopper.dart';

@ChopperApi()
abstract class ThetaService extends ChopperService {
  @Post(
    path: 'authen/v1/api/auth/client',
  )
  Future<Response<Result<LoginOutPutModel>>> login(@Body() LoginInPutModel loginModel);

  static ThetaService create() {
    return _$ThetaService();
  }
}