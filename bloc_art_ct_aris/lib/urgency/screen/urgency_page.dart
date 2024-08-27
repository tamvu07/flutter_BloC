import 'package:bloc_art_ct_aris/common/utils/context+extensions.dart';
import 'package:bloc_art_ct_aris/login/bloc/login_bloc.dart';
import 'package:bloc_art_ct_aris/login/services/login_service.dart';
import 'package:bloc_art_ct_aris/urgency/bloc/urgency_bloc.dart';
import 'package:bloc_art_ct_aris/urgency/services/urgency_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UrgencyPage extends StatefulWidget {
  const UrgencyPage({super.key});

  @override
  State<UrgencyPage> createState() => _UrgencyPageState();
}

class _UrgencyPageState extends State<UrgencyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UrgencyBloc(urgencyService: UrgencyService()),
      child: BlocBuilder<UrgencyBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(flex: 4, child: Container()),
                  const Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [UrgencyButton()],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UrgencyButton extends StatefulWidget {
  const UrgencyButton({super.key});

  @override
  State<UrgencyButton> createState() => _UrgencyButtonState();
}

class _UrgencyButtonState extends State<UrgencyButton> {
  Future<void> actionGetUrgency(BuildContext context) async {
    BlocProvider.of<UrgencyBloc>(context).add(StartUrgencyEvent());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UrgencyBloc>().stream.listen((loginState) {
      switch (loginState.status) {
        case LoginStatus.initial:
          break;
        case LoginStatus.loading:
          context.showLoadingDialog();
        case LoginStatus.success:
          context.dismissDialog();
          var listService = loginState.data.setting.detectionsModel;
          String str = '';
          for (int i = 0; i < listService.length; i++) {
            str += '${listService[i].name} \n';
          }
          context.showErrorDialog("Thanh cong nha data la: \n $str");
          break;
        case LoginStatus.failure:
          context.dismissDialog();
          context.showErrorDialog(loginState.error!.getErrorMsg());
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Get urgency'),
        onPressed: () {
          actionGetUrgency(context);
        });
  }
}
