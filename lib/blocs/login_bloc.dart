import 'package:flutter/foundation.dart';
import 'package:youapp_assignment/data/models/auth_model.dart';
import 'package:youapp_assignment/data/models/auth_model_impl.dart';
import 'package:youapp_assignment/utils/string_utility.dart';

class LoginBloc extends ChangeNotifier {
  /// bloc controls
  bool _isDispose = false;

  /// page control
  bool isLoading = false;

  /// models
  final AuthModel _mAuthModel = AuthModelImpl();

  /// states
  bool isPasswordVisible = false;
  String? mUserName;
  String? mPassword;

  /// onChange UserName
  void onChangeUserName({required String userName}) {
    mUserName = userName;
    _notifySafely();
  }

  /// onChange Password
  void onChangePassword({required String password}) {
    mPassword = password;
    _notifySafely();
  }

  /// on tap login button when all input field is valid
  Future onTapLogin() async {
    if (isValidToLogin()) {
      return _mAuthModel.login(userName: mUserName, password: mPassword);
    }
  }

  /// check all input field not to be null or empty
  bool isValidToLogin() =>
      mUserName.isNotNullOrEmpty() && mPassword.isNotNullOrEmpty();

  /// change password keyword visibility
  void onTapPasswordToggleVisible() {
    isPasswordVisible = !isPasswordVisible;
    _notifySafely();
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
