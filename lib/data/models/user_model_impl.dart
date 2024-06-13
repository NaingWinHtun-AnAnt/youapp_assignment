import 'package:stream_transform/stream_transform.dart';
import 'package:youapp_assignment/data/models/user_model.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/network/dataagents/data_agent.dart';
import 'package:youapp_assignment/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:youapp_assignment/network/requests/update_profile_request.dart';
import 'package:youapp_assignment/persistence/daos/profile_dao.dart';
import 'package:youapp_assignment/persistence/daos/profile_dao_impl.dart';

class UserModelImpl extends UserModel {
  static final UserModelImpl _singleton = UserModelImpl._internal();

  UserModelImpl._internal();

  factory UserModelImpl() {
    return _singleton;
  }

  /// data agent
  DataAgent _mDataAgent = RetrofitDataAgentImpl();

  /// daos
  ProfileDao _mProfileDao = ProfileDaoImpl();

  void setDaosAndDataAgent({
    required DataAgent dataAgent,
    required ProfileDao profileDao,
  }) {
    _mDataAgent = dataAgent;
    _mProfileDao = profileDao;
  }

  @override
  void getProfile() => _mDataAgent
      .getProfile(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NjkzMjg5NDhjZTFmN2EzOWFjOGJkNyIsInVzZXJuYW1lIjoidGVzdFRFU1QiLCJlbWFpbCI6InRlc3RURVNUIiwiaWF0IjoxNzE4MTcwMjYyLCJleHAiOjE3MTgxNzM4NjJ9.KrDdsIpb1v7mfxuYgdbvSOgeLnp8IBpJSh9NfjnaVgY",
      )
      .then((profile) {});

  @override
  void updateProfile({
    required String token,
    required String? birthday,
    required List<String> interests,
    required String? name,
    required int? height,
    required int? weight,
  }) =>
      _mDataAgent
          .updateProfile(
              token: token,
              request: UpdateProfileRequest(
                birthday: birthday,
                height: height,
                interests: interests,
                name: name,
                weight: weight,
              ))
          .then((value) {});

  /// from Database
  @override
  Stream<ProfileVO?> getProfileFromDatabase() {
    return _mProfileDao
        .getProfileEventStream()
        .startWith(_mProfileDao.getProfileStream())
        .map((event) => _mProfileDao.getProfile());
  }

  @override
  void updateProfileToDatabase({
    required String? birthday,
    required List<String> interests,
    required String? displayName,
    required String? height,
    required String? weight,
    required String? gender,
    required String? zodiac,
    required String? horoscope,
    required String? profilePhoto,
  }) {
    _mProfileDao.saveProfile(
      ProfileVO(
        weight: weight,
        interests: interests,
        birthday: birthday,
        height: height,
        displayName: displayName,
        gender: gender,
        horoscope: horoscope,
        zodiac: zodiac,
        profilePhoto: profilePhoto,
      ),
    );
  }
}
