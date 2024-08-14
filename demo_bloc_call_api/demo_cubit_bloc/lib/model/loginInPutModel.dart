// ignore_for_file: public_member_api_docs, sort_constructors_first

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
    this.username,
    this.password,
    this.deviceType,
    this.deviceToken,
  );

  factory LoginInPutModel.fromJson(Map<String, dynamic> json) => _$LoginInPutModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInPutModelToJson(this);
}

