import 'package:demo_mqtt/src/core/app_assets.dart';
import 'package:demo_mqtt/src/mqtt_manager.dart';
import 'package:demo_mqtt/src/mqtt_state.dart';
import 'package:flutter/material.dart';

late MQTTManager manager;
late MQTTState _currentAppState;

Future<void> _configureAndConnect(
    String uuid, MQTTState currentAppState) async {
  manager = MQTTManager(
      host: 'mqtt.onskycloud.com',
      identifier: 'care-web-$uuid',
      state: currentAppState);
  await manager.initializeMQTTClient();
}

Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
   
  _currentAppState = MQTTState();

  await _configureAndConnect(_currentAppState.uuid, _currentAppState);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
        width: 100.0, // Đặt kích thước container theo ý muốn
        height: 100.0,
        child: Image.asset(
          AppAssets.icCalibrationSettingsMobile,// Thay đổi màu sắc nếu cần
        ),
      ),
      )
    );
  }
}
