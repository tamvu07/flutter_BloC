import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MQTTState with ChangeNotifier {
  final uuid = const Uuid().v4();
}