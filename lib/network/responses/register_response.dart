import 'package:json_annotation/json_annotation.dart';

part "register_response.g.dart";

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "message")
  String? message;

  RegisterResponse({
    this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
