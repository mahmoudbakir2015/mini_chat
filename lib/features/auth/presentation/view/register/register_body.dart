import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/core/widget/build_auth_button.dart';
import 'package:mini_chat/core/widget/build_auth_footer.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/build_logo.dart';
import 'package:mini_chat/features/auth/data/model/auth_model.dart';
import 'package:mini_chat/features/auth/data/view_model/auth_cubit.dart';
import 'package:mini_chat/features/auth/data/view_model/auth_states.dart';
import 'widgets/form_register.dart';

// ignore: must_be_immutable
class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  AuthCubit authCubit = AuthCubit();

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Build register screen
  ///
  /// This method is used to build register screen
  ///
  /// It consist of logo, divider, form register, divider, auth button and auth footer
  ///
  /// It used [buildLogo], [buildCustomDivider], [buildRegisterForm], [buildAuthButton],
  /// and [buildAuthFooter]
  ///
  /// It also used [BouncingScrollPhysics] to make the screen can be scrolled
  ///
  /// You can change the appearance of the screen by changing the value of
  /// [email], [password], [isObscure], [name], and [phone]

  /// ****  c8414f9c-55d2-4172-8a8d-5179ecf6ae1c  ******
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, AuthStates state) {
        if (state is RegisterFailure) {
          authCubit.showInSnackBar(
            context: context,
            value: state.error,
          );
        }
      },
      bloc: authCubit,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildLogo(context),
              buildCustomDivider(context),
              const Text(
                'Register To New Account',
                style: AppStyles.textBoldBlack_25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: buildRegisterForm(
                  context: context,
                  email: authCubit.emailController,
                  password: authCubit.passwordController,
                  name: authCubit.nameControler,
                  phone: authCubit.phoneControler,
                  isObscure: authCubit.isObscure,
                  onTap: authCubit.showPassword,
                  emailValidate: authCubit.emailValidate,
                  passValidate: authCubit.passwordValidate,
                  nameValidate: authCubit.nameValidate,
                  phoneValidate: authCubit.phoneNumberValidate,
                  registerFormKey: authCubit.authFormKey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: (state is AuthLoading)
                    ? const CircularProgressIndicator()
                    : buildAuthButton(
                        context: context,
                        isRegister: true,
                        onPressed: () {
                          if (authCubit.authFormKey.currentState!.validate()) {
                            authCubit.signUp(
                              authModel: AuthModel(
                                email: authCubit.emailController.text,
                                password: authCubit.passwordController.text,
                                name: authCubit.nameControler.text,
                                phone: authCubit.phoneControler.text,
                              ),
                              context: context,
                            );
                            // ignore: use_build_context_synchronously
                          }
                        }),
              ),
              buildAuthFooter(context: context, isRegister: true),
            ],
          ),
        ),
      ),
    );
  }
}
