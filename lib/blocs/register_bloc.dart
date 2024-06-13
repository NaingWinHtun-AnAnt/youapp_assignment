import 'package:flutter/foundation.dart';
import 'package:youapp_assignment/data/models/auth_model.dart';
import 'package:youapp_assignment/data/models/auth_model_impl.dart';
import 'package:youapp_assignment/utils/string_utility.dart';

class RegisterBloc extends ChangeNotifier {
  /// bloc controls
  bool _isDispose = false;

  /// page control
  bool isLoading = false;

  /// data agents
  final AuthModel _mAuthModel = AuthModelImpl();

  /// states
  bool isPasswordVisible = false;
  String? mEmail;
  String? mUserName;
  String? mPassword;
  String? mConfirmPassword;

  /// onChange UserName
  void onChangeEmail({required String email}) {
    mEmail = email;
    _notifySafely();
  }

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

  /// onChange Password
  void onChangeConfirmPassword({required String confirmPassword}) {
    mConfirmPassword = confirmPassword;
    _notifySafely();
  }

  /// on tap login button when all input field is valid
  Future onTapRegister() async {
    if (isValidToRegister()) {
      return _mAuthModel.register(
          email: mEmail, userName: mUserName, password: mPassword);
    }
  }

  /// check all input field not to be null or empty
  bool isValidToRegister() =>
      mEmail.isNotNullOrEmpty() &&
      mEmail.isEmail() &&
      mUserName.isNotNullOrEmpty() &&
      mPassword.isNotNullOrEmpty() &&
      mConfirmPassword.isNotNullOrEmpty() &&
      mPassword == mConfirmPassword;

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
