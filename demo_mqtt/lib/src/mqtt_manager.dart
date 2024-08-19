
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
      // Note if you get a 'TlsException: Failure trusting builtin roots (OS Error:
      //  CERT_ALREADY_IN_HASH_TABLE' error here comment out the following 2 lines
      // final crtFile = currDir + path.join('pem', 'ca.crt');
      final ByteData crtData = await rootBundle.load('assets/ca.crt');
      // Convert ByteData to Uint8List
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

    const tokenAdmin =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoxNTcxLCJjX24iOiIzMzg5MzU4OTU5MjM1MTcxODcyIiwiZXhwIjoyOTcwODUzMzUxLCJpZCI6MTYxOSwiciI6NSwidSI6ImFkbWluX3dzc0BnbWFpbC5jb20iLCJ1X3VpZCI6ImMzN2Y3ZjIwLTg3OWQtNDJlNi1iZTczLTRlZGJhYmMxODY2OCJ9.DfIKv2sSI1H6_OqEPL_R6t6S-P9Zwn8QovQpwSR-gg4';

    final connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier)
        .authenticateAs("admin_wss@gmail.com", "Bearer $tokenAdmin")
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
    print("a2.............MQtt connect nha..................");
  }

  void onSubscribed(String topic) {

  }

  void onUnsubscribed(String? topic) {

  }

  void pong() {}

  void disconnect() {
    client.disconnect();
  }
}