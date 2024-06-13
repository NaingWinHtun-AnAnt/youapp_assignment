// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponse _$UpdateProfileResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileVO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileResponseToJson(
        UpdateProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
