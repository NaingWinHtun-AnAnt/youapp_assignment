import 'package:flutter/foundation.dart';
import 'package:youapp_assignment/data/models/user_model.dart';
import 'package:youapp_assignment/data/models/user_model_impl.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/utils/string_utility.dart';

class EditInterestBloc extends ChangeNotifier {
  /// bloc controls
  bool _isDispose = false;

  /// page control
  bool isLoading = false;

  /// models
  final UserModel _mUserModel = UserModelImpl();

  /// states
  List<String> mInterestList = [];
  ProfileVO? profile;

  EditInterestBloc() {
    _mUserModel.getProfileFromDatabase().listen((data) {
      profile = data;
      _notifySafely();
    });
  }

  /// onTap Delete Interest
  void onSubmittedInterest({required String? interest}) {
    if (interest.isNotNullOrEmpty() && !mInterestList.contains(interest)) {
      mInterestList.add(interest ?? "");
      _notifySafely();
    }
  }

  /// onTap Delete Interest
  void onTapDeleteInterest({required int index}) {
    mInterestList.removeAt(index);
    _notifySafely();
  }

  /// on Tap Save Interest
  void onTapInterests() {
    if (mInterestList.isNotEmpty) {
      mInterestList.map((e) {
        profile?.interests?.add(e);
      }).toList();
    }
    _mUserModel.updateProfileToDatabase(
      birthday: profile?.birthday,
      interests: profile?.interests ?? [],
      displayName: profile?.displayName,
      height: profile?.height,
      weight: profile?.weight,
      gender: profile?.gender,
      zodiac: profile?.zodiac,
      horoscope: profile?.horoscope,
      profilePhoto: profile?.profilePhoto,
    );
  }

  /// show loading
  void showLoading() {
    isLoading = true;
    _notifySafely();
  }

  /// hide loading
  void hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!_isDispose) notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
  }
}
