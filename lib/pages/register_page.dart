import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youapp_assignment/blocs/register_bloc.dart';
import 'package:youapp_assignment/pages/home_page.dart';
import 'package:youapp_assignment/pages/login_page.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';
import 'package:youapp_assignment/resources/strings.dart';
import 'package:youapp_assignment/utils/handle_errors.dart';
import 'package:youapp_assignment/utils/navigation_utility.dart';
import 'package:youapp_assignment/utils/sizes_utilities.dart';
import 'package:youapp_assignment/widgets/back_button_view.dart';
import 'package:youapp_assignment/widgets/gradient_background_view.dart';
import 'package:youapp_assignment/widgets/gradient_text_view.dart';
import 'package:youapp_assignment/widgets/headline_small_text_view.dart';
import 'package:youapp_assignment/widgets/long_button_view.dart';
import 'package:youapp_assignment/widgets/text_field_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterBloc(),
      child: Scaffold(
        body: GradientBackgroundView(
          child: Stack(
            children: [
              Consumer<RegisterBloc>(
                builder:
                    (BuildContext context, RegisterBloc bloc, Widget? child) =>
                        SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenSizeByPercent(
                            context: context, percent: 14),
                      ),
                      const HeadlineSmallTextView(
                        text: txtRegister,
                      ),
                      LoginTextFieldAndButtonSectionView(
                        onChangeEmail: (email) =>
                            bloc.onChangeEmail(email: email),
                        onChangeUserName: (userName) =>
                            bloc.onChangeUserName(userName: userName),
                        onChangeCreatePassword: (password) =>
                            bloc.onChangePassword(password: password),
                        onChangeConfirmPassword: (confirmPassword) =>
                            bloc.onChangeConfirmPassword(
                                confirmPassword: confirmPassword),
                        onTapPasswordVisibleIcon: () =>
                            bloc.onTapPasswordToggleVisible(),
                        onTapRegister: () => bloc.onTapRegister().then((value) {
                          navigateReplacementTo(context, const HomePage());
                        }).then((error) {
                          showSnackBar(
                              context: context,
                              message: handleError(error: error));
                        }),
                        isValidToRegister: bloc.isValidToRegister(),
                        isPasswordVisible: bloc.isPasswordVisible,
                      ),
                      const SizedBox(
                        height: marginLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            txtHaveAnAccount,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: textRegular,
                              color: colorWhite,
                            ),
                          ),
                          GradientTextView(
                            text: txtLoginHere,
                            onTap: () => navigateTo(
                              context,
                              const LoginPage(),
                            ),
                            colorList: goldenColorList,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BackButtonView(
                onTap: () => popBack(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextFieldAndButtonSectionView extends StatelessWidget {
  final Function(String) onChangeEmail;
  final Function(String) onChangeUserName;
  final Function(String) onChangeCreatePassword;
  final Function(String) onChangeConfirmPassword;
  final Function onTapPasswordVisibleIcon;
  final Function onTapRegister;
  final bool isValidToRegister;
  final bool isPasswordVisible;

  const LoginTextFieldAndButtonSectionView({
    super.key,
    required this.onChangeEmail,
    required this.onChangeUserName,
    required this.onChangeCreatePassword,
    required this.onChangeConfirmPassword,
    required this.onTapPasswordVisibleIcon,
    required this.onTapRegister,
    required this.isValidToRegister,
    required this.isPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(marginMedium2Large),
      child: Column(
        children: [
          TextFieldView(
            hintText: hintEmail,
            onChange: (email) => onChangeEmail(email),
          ),
          const SizedBox(
            height: marginMedium2,
          ),
          TextFieldView(
            hintText: hintCreateUserName,
            onChange: (userName) => onChangeUserName(userName),
          ),
          const SizedBox(
            height: marginMedium2,
          ),
          TextFieldView(
            hintText: hintCreatePassword,
            onChange: (password) => onChangeCreatePassword(password),
            isObscure: isPasswordVisible,
            textInputType: TextInputType.number,
            isPasswordField: true,
            onTapSuffixIcon: () => onTapPasswordVisibleIcon(),
          ),
          const SizedBox(
            height: marginMedium2,
          ),
          TextFieldView(
            hintText: hintCreatePassword,
            onChange: (confirmPassword) =>
                onChangeConfirmPassword(confirmPassword),
            isObscure: isPasswordVisible,
            textInputType: TextInputType.number,
            isPasswordField: true,
            onTapSuffixIcon: () => onTapPasswordVisibleIcon(),
          ),
          const SizedBox(
            height: marginMedium2Large,
          ),
          LongButtonView(
            text: txtRegister,
            onTap: () => onTapRegister(),
            isActive: isValidToRegister,
          ),
        ],
      ),
    );
  }
}
