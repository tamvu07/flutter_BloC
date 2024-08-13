import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/service/theta_service.dart';
import 'package:equatable/equatable.dart';

part 'theta_state.dart';

class ThetaCubit extends Cubit<ThetaState> {
final chopper = ChopperClient(
  baseUrl: Uri.parse("https://catfact.ninja"),
  services: [ThetaService.create()],
  converter: const JsonConverter(),
);

  ThetaCubit() : super(const ThetaInitial("camera response"));

  void getInfo() async {
    emit(const ThetaLoading());
    final thetaService = chopper.getService<ThetaService>();
    var response = await thetaService.thetaInfo();
    emit(ThetaLoaded(response.body.toString()));
  }
}
