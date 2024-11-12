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
import 'package:mini_chat/features/auth/presentation/view/sign_in/widgets/form_sign_in.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// A widget that builds a sign in screen.
  ///
  /// This widget includes a logo, a sign in form, an auth button, and a footer.
  ///
  /// ****  ed3d5ac0-9679-421c-8d7a-4ffefccd243c  ******
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit();
    return BlocConsumer<AuthCubit, AuthStates>(
      bloc: authCubit,
      listener: (BuildContext context, AuthStates state) {
        if (state is SignInFailure) {
          authCubit.showInSnackBar(
            context: context,
            value: state.error,
          );
        }
      },
      builder: (context, state) {
        return Padding(
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
                  'Log in to your account',
                  style: AppStyles.textBoldBlack_25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: buildSignInForm(
                    context: context,
                    email: authCubit.emailController,
                    password: authCubit.passwordController,
                    isObscure: authCubit.isObscure,
                    onTap: authCubit.showPassword,
                    emailValidate: authCubit.emailValidate,
                    passValidate: authCubit.passwordValidate,
                    signInFormKey: authCubit.authFormKey,
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
                          onPressed: () {
                            if (authCubit.authFormKey.currentState!
                                .validate()) {
                              authCubit.login(
                                authModel: AuthModel(
                                  email: authCubit.emailController.text,
                                  password: authCubit.passwordController.text,
                                ),
                                context: context,
                              );
                            }
                          },
                        ),
                ),
                buildAuthFooter(context: context),
              ],
            ),
          ),
        );
      },
    );
  }
}
