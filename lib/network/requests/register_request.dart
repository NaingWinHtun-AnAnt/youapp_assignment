import 'package:json_annotation/json_annotation.dart';

part "register_request.g.dart";

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "password")
  String? password;

  RegisterRequest({
    this.email,
    this.username,
    this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
