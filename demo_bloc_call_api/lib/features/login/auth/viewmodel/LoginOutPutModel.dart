import 'package:json_annotation/json_annotation.dart';

part 'LoginOutPutModel.g.dart';

@JsonSerializable()
class LoginOutPutModel {

String token;
  String expires;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  LoginOutPutModel(
      {required this.token, required this.expires, required this.refreshToken});

  factory LoginOutPutModel.fromJson(Map<String, dynamic> json) => _$LoginOutPutModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginOutPutModelToJson(this);
}
