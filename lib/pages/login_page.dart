import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youapp_assignment/blocs/login_bloc.dart';
import 'package:youapp_assignment/pages/home_page.dart';
import 'package:youapp_assignment/pages/register_page.dart';
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Scaffold(
        body: GradientBackgroundView(
          child: Stack(
            children: [
              Consumer<LoginBloc>(
                builder:
                    (BuildContext context, LoginBloc bloc, Widget? child) =>
                        SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenSizeByPercent(
                            context: context, percent: 14),
                      ),
                      const HeadlineSmallTextView(
                        text: txtLogin,
                      ),
                      LoginTextFieldAndButtonSectionView(
                        onChangeUserName: (userName) =>
                            bloc.onChangeUserName(userName: userName),
                        onChangePassword: (password) =>
                            bloc.onChangePassword(password: password),
                        onTapLogin: () => bloc.onTapLogin().then((value) {
                          navigateTo(
                            context,
                            const HomePage(
                              key: Key(keyHomePage),
                            ),
                          );
                        }).catchError((error) {
                          showSnackBar(
                            context: context,
                            message: handleError(error: error),
                          );
                        }),
                        isValidToLogin: bloc.isValidToLogin(),
                        isPasswordVisible: bloc.isPasswordVisible,
                        onTapPasswordVisibleIcon: () =>
                            bloc.onTapPasswordToggleVisible(),
                      ),
                      const SizedBox(
                        height: marginLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            txtNoAccount,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: textRegular,
                              color: colorWhite,
                            ),
                          ),
                          GradientTextView(
                            text: txtRegisterHere,
                            onTap: () => navigateTo(
                              context,
                              const RegisterPage(),
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
  final Function(String) onChangeUserName;
  final Function(String) onChangePassword;
  final Function onTapLogin;
  final bool isValidToLogin;
  final bool isPasswordVisible;
  final Function onTapPasswordVisibleIcon;

  const LoginTextFieldAndButtonSectionView({
    super.key,
    required this.onChangeUserName,
    required this.onChangePassword,
    required this.onTapLogin,
    required this.isValidToLogin,
    required this.isPasswordVisible,
    required this.onTapPasswordVisibleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(marginMedium2Large),
      child: Column(
        children: [
          TextFieldView(
            key: const Key(keyUserName),
            hintText: hintUserName,
            onChange: (userName) => onChangeUserName(userName),
          ),
          const SizedBox(
            height: marginMedium2,
          ),
          TextFieldView(
            key: const Key(keyPassword),
            hintText: hintPassword,
            onChange: (password) => onChangePassword(password),
            isObscure: isPasswordVisible,
            textInputType: TextInputType.number,
            isPasswordField: true,
            onTapSuffixIcon: () => onTapPasswordVisibleIcon(),
          ),
          const SizedBox(
            height: marginMedium2Large,
          ),
          LongButtonView(
            key: const Key(keyLoginButton),
            text: txtLogin,
            onTap: () => onTapLogin(),
            isActive: isValidToLogin,
          ),
        ],
      ),
    );
  }
}
