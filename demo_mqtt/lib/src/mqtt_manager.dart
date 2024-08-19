
import 'dart:io';
import 'dart:typed_data';

import 'package:demo_mqtt/src/mqtt_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager<T extends MqttClient> {

  final MQTTState _currentState;
  late T client;
  final String _identifier;
  final String _host;

  MQTTManager(
      {required String host,
      required String identifier,
      required MQTTState state
      }) : _identifier = identifier,
        _host = host,
        _currentState = state;

  Future<MqttClient?> initializeMQTTClient() async {
    
    // la mobile
    client = MqttServerClient(_host, _identifier) as T;
      client.port = 8883;
      (client as MqttServerClient).secure = true;
      final context = SecurityContext.defaultContext;
      final ByteData crtData = await rootBundle.load('assets/ca.crt');
      final Uint8List crtBytes = crtData.buffer.asUint8List();
      context.setTrustedCertificatesBytes(crtBytes);
      (client as MqttServerClient)?.securityContext = context;
      (client as MqttServerClient).onBadCertificate = (Object a) => true;
      // la mobile
    client.setProtocolV311();

    client.keepAlivePeriod = 20;

    client.connectTimeoutPeriod = 6000; // milliseconds

    client.onDisconnected = onDisconnected;

    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;
    client.onUnsubscribed = onUnsubscribed;

    client.websocketProtocols = MqttClientConstants.protocolsMultipleDefault;

    final connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier)
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atMostOnce);

    client.connectionMessage = connMess;
    await connect();
    return client;
  }

  Future<void> connect() async {
    assert(client != null);
    try {
      debugPrint('connecting...');
      await client.connect();
    } on Exception catch (e) {
      debugPrint('error connecting is: $e');
      disconnect();
    }
  }
  void onDisconnected() {

  }

  void onConnected() {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
        subscribe("things/84:86:f3:00:29:0b/realtime_response");
    }
    handleResponseByMQTT();
  }

  void onSubscribed(String topic) {

  }

  void onUnsubscribed(String? topic) {

  }

  void pong() {}

  void disconnect() {
    client.disconnect();
  }

  void subscribe(String topic) async {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print("a2.............subscribe topic is: $topic..................");
      client.subscribe(topic, MqttQos.atMostOnce);
    }
  }

  void handleResponseByMQTT() {
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print('a2......handleResponseByMQTT.......${recMess.variableHeader!.topicName}....... $pt...............');
    });
  }
}