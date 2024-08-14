// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'loginOutPutModel.g.dart';

@JsonSerializable()
class LoginOutPutModel {

  String token;
  String expires;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  LoginOutPutModel(
    this.token,
    this.expires,
    this.refreshToken,
  );

  factory LoginOutPutModel.fromJson(Map<String, dynamic> json) => _$LoginOutPutModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginOutPutModelToJson(this);
}

