import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/network/requests/login_request.dart';
import 'package:youapp_assignment/network/requests/register_request.dart';
import 'package:youapp_assignment/network/requests/update_profile_request.dart';

abstract class DataAgent {
  Future<String?>? register({required RegisterRequest registerRequest});

  Future<String?>? login({required LoginRequest loginRequest});

  Future<ProfileVO> getProfile({required String token});

  Future<ProfileVO> updateProfile({
    required UpdateProfileRequest request,
    required String token,
  });
}
