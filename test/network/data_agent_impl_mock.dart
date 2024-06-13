import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/network/dataagents/data_agent.dart';
import 'package:youapp_assignment/network/requests/login_request.dart';
import 'package:youapp_assignment/network/requests/register_request.dart';
import 'package:youapp_assignment/network/requests/update_profile_request.dart';

import '../mock_data/mock_data.dart';

class DataAgentImplMock extends DataAgent {
  @override
  Future<ProfileVO> getProfile({required String token}) =>
      Future.value(getMockProfile());

  @override
  Future<String?>? login({required LoginRequest loginRequest}) =>
      Future.value(getMockString());

  @override
  Future<String?>? register({required RegisterRequest registerRequest}) =>
      Future.value(getMockString());

  @override
  Future<ProfileVO> updateProfile(
          {required UpdateProfileRequest request, required String token}) =>
      Future.value(getMockProfile());
}
