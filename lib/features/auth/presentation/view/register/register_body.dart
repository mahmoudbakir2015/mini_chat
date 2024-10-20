import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/core/widget/build_auth_button.dart';
import 'package:mini_chat/core/widget/build_auth_footer.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/build_logo.dart';
import 'package:mini_chat/features/whats/presentation/views/whats_view.dart';
import 'widgets/form_register.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isObscure = true;
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
              'Register To New Account',
              style: AppStyles.textBoldBlack_25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: buildRegisterForm(
                context: context,
                email: email,
                password: password,
                isObscure: isObscure,
                onTap: () {
                  isObscure = !isObscure;
                  setState(
                    () {},
                  );
                },
                emailValidate: (String? value) {
                  return null;
                },
                passValidate: (String? value) {
                  return null;
                },
                name: name,
                phone: phone,
                nameValidate: (String? v) {
                  return null;
                },
                phoneValidate: (String? v) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: buildAuthButton(
                context: context,
                isRegister: true,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WhatsView(),
                    ),
                  );
                },
              ),
            ),
            buildAuthFooter(context: context, isRegister: true),
          ],
        ),
      ),
    );
  }
}
