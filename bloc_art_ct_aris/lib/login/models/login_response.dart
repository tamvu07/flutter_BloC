class LoginResponse {
  int? code;
  String? message;
  LoginData? data;

  LoginResponse({
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  String? token;
  String? expires;
  String? refreshToken;

  LoginData({
    this.token,
    this.expires,
    this.refreshToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] as String?,
      expires: json['expires'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );
  }
}