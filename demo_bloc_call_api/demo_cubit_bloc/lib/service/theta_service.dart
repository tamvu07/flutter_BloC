import 'dart:async';
import 'package:chopper/chopper.dart';

part 'theta_service.chopper.dart';

@ChopperApi(baseUrl: '/osc')
abstract class ThetaService extends ChopperService {
  @Get(
    path: '/fact',
  )
  Future<Response> thetaInfo();

  static ThetaService create() {
    return _$ThetaService();
  }
}