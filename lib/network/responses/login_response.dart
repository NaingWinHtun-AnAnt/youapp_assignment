import 'package:json_annotation/json_annotation.dart';

part "login_response.g.dart";

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "access_token")
  String? accessToken;

  LoginResponse({
    this.message,
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
