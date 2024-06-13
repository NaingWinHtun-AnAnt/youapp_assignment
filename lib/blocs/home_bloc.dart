import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youapp_assignment/data/models/user_model.dart';
import 'package:youapp_assignment/data/models/user_model_impl.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/resources/strings.dart';

class HomeBloc extends ChangeNotifier {
  /// bloc controls
  bool _isDispose = false;

  /// page control
  bool isLoading = false;

  /// data agents
  UserModel _mUserModel = UserModelImpl();

  /// states
  File? image;
  final ImagePicker _picker = ImagePicker();
  ProfileVO? mProfile = ProfileVO();
  final List<String> _mInterestList = [];
  AboutStatus mStatus = AboutStatus.empty;
  String? _mDisplayName;
  String? _mGender;
  String? mBirthday;
  String? horoscope;
  String? zodiac;
  String? _mHeight;
  String? _mWeight;

  HomeBloc({UserModel? userModel}) {
    /// set movieModel with movieModelMock
    if (userModel != null) {
      _mUserModel = userModel;
    }

    /// get Profile data from database
    _mUserModel.getProfileFromDatabase().listen((profile) {
      mProfile = profile;
      if (mProfile != null) {
        mStatus = AboutStatus.fill;
      }
      _notifySafely();
    });
  }

  /// on change display name on user typing
  void onChangeDisplayName({required String displayName}) {
    _mDisplayName = displayName;
    _notifySafely();
  }

  /// on change gender on user Select
  void onChangeGender({required String gender}) {
    _mGender = gender;
    _notifySafely();
  }

  /// on change birthday on user Select
  void onChangeBirthday({required DateTime birthday}) {
    mBirthday = formatDate(birthday);

    zodiac = getZodiacSign(birthday);

    horoscope = getChineseZodiac(birthday);

    _notifySafely();
  }

  /// formatDate
  String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return "$day $month $year";
  }

  /// calculate zodiac sign
  String getZodiacSign(DateTime birthDate) {
    int day = birthDate.day;
    int month = birthDate.month;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return "Pisces";
    }
    return "Unknown";
  }

  /// get chinese zodiac
  String getChineseZodiac(DateTime date) {
    for (var entry in chineseZodiacDates) {
      if (date.isAfter(entry['start'].subtract(const Duration(days: 1))) &&
          date.isBefore(entry['end'].add(const Duration(days: 1)))) {
        return entry['sign'];
      }
    }
    return "Unknown";
  }

  /// on change birthday on user Select
  void onChangeHeight({required String height}) {
    _mHeight = height;
    _notifySafely();
  }

  /// on change birthday on user Select
  void onChangeWeight({required String weight}) {
    _mWeight = weight;
    _notifySafely();
  }

  /// on change status on user click of about edit icon
  void onChangeAboutStatus() {
    mStatus = (mStatus == AboutStatus.empty || mStatus == AboutStatus.fill)
        ? AboutStatus.edit
        : AboutStatus.fill;
    _notifySafely();
  }

  /// on tap save and update without validating
  void onTapSaveAndUpdate() {
    _mUserModel.updateProfileToDatabase(
      birthday: mBirthday,
      interests: _mInterestList,
      displayName: _mDisplayName,
      height: _mHeight,
      weight: _mWeight,
      gender: _mGender,
      zodiac: zodiac,
      horoscope: horoscope,
      profilePhoto: image?.path,
    );
    onChangeAboutStatus();
  }

  /// pick image
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      _notifySafely();
    }
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

enum AboutStatus {
  empty,
  edit,
  fill,
}
