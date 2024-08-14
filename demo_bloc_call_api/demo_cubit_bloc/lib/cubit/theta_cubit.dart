import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/model/loginInPutModel.dart';
import 'package:demo_cubit_bloc/model/loginOutPutModel.dart';
import 'package:demo_cubit_bloc/model/model_converter.dart';
import 'package:demo_cubit_bloc/service/theta_service.dart';
import 'package:equatable/equatable.dart';

part 'theta_state.dart';

class ThetaCubit extends Cubit<ThetaState> {
final chopper = ChopperClient(
  baseUrl: Uri.parse('https://api.onskycloud.com'),
  services: [ThetaService.create()],
  converter:  ModelConverter(),
);

  ThetaCubit() : super(const ThetaInitial("camera response"));

  void getInfo() async {
    emit(const ThetaLoading());
    final thetaService = chopper.getService<ThetaService>();
    final loginInPut = LoginInPutModel("t@yahoo.com", "12345612", 3, "");
    var response = await thetaService.login(loginInPut);
    if (response.isSuccessful) {
      
      final data = (response.body as Success).value as LoginOutPutModel;
      var token = data.token;
      emit(ThetaLoaded("Login thanh cong la : $token"));
    } else {
       emit(ThetaLoaded("Login that bai..."));
    }
    // emit(ThetaLoaded(response.body.toString()));
  }
}
