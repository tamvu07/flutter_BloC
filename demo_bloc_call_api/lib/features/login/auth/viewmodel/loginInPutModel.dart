
import 'package:json_annotation/json_annotation.dart';

part 'loginInPutModel.g.dart';

@JsonSerializable()
class LoginInPutModel {

  String username;
  String password;
  @JsonKey(name: 'device_type')
  int deviceType;
  @JsonKey(name: 'device_token')
  String? deviceToken;

  LoginInPutModel(
      {required this.username,
      required this.password,
      this.deviceToken,
      required this.deviceType});

  factory LoginInPutModel.fromJson(Map<String, dynamic> json) => _$LoginInPutModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInPutModelToJson(this);
}

