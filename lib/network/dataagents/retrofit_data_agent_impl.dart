import 'package:dio/dio.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/network/api_constants.dart';
import 'package:youapp_assignment/network/dataagents/data_agent.dart';
import 'package:youapp_assignment/network/requests/login_request.dart';
import 'package:youapp_assignment/network/requests/register_request.dart';
import 'package:youapp_assignment/network/requests/update_profile_request.dart';
import 'package:youapp_assignment/network/the_you_app_api.dart';
import 'package:youapp_assignment/utils/string_utility.dart';

class RetrofitDataAgentImpl extends DataAgent {
  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  late TheYouAppApi _mApi;

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    dio.options = BaseOptions(headers: {
      headerContentType: headerContentTypeValue,
    });
    _mApi = TheYouAppApi(dio);
  }

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  @override
  Future<String?>? login({required LoginRequest loginRequest}) {
    return _mApi.login(loginRequest).then((response) {
      if (response.accessToken.isNotNullOrEmpty()) {
        return Future.value(response.accessToken);
      } else {
        return Future.error(response);
      }
    });
  }

  @override
  Future<String?>? register({required RegisterRequest registerRequest}) {
    return _mApi.register(registerRequest).then((response) {
      if (response.message.runtimeType != List) {
        return Future.value(response.message);
      } else {
        return Future.error(response);
      }
    });
  }

  @override
  Future<ProfileVO> getProfile({required String token}) {
    return _mApi.getProfile(token).then((response) {
      if (response.data != null) {
        return Future.value(response.data);
      } else {
        return Future.error(response);
      }
    });
  }

  @override
  Future<ProfileVO> updateProfile({
    required UpdateProfileRequest request,
    required String token,
  }) {
    return _mApi.updateProfile(token, request).then((response) {
      if (response.data != null) {
        return Future.value(response.data);
      } else {
        return Future.error(response);
      }
    });
  }
}
