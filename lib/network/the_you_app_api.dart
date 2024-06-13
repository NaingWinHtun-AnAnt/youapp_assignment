import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:youapp_assignment/network/api_constants.dart';
import 'package:youapp_assignment/network/requests/login_request.dart';
import 'package:youapp_assignment/network/requests/register_request.dart';
import 'package:youapp_assignment/network/requests/update_profile_request.dart';
import 'package:youapp_assignment/network/responses/get_profile_response.dart';
import 'package:youapp_assignment/network/responses/login_response.dart';
import 'package:youapp_assignment/network/responses/register_response.dart';
import 'package:youapp_assignment/network/responses/update_profile_response.dart';

part 'the_you_app_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class TheYouAppApi {
  factory TheYouAppApi(Dio dio) = _TheYouAppApi;

  /// register
  @POST(endPointRegister)
  Future<RegisterResponse> register(
    @Body() RegisterRequest registerRequest,
  );

  /// login
  @POST(endPointLogin)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );

  /// get Profile
  @GET(endPointGetProfile)
  Future<GetProfileResponse> getProfile(
    @Header(paramXAccessToken) String token,
  );

  /// update profile
  @PUT(endPointUpdateProfile)
  Future<UpdateProfileResponse> updateProfile(
    @Header(paramXAccessToken) String token,
    @Body() UpdateProfileRequest updateProfileRequest,
  );
}
