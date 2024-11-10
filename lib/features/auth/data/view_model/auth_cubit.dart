import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/auth/data/model/auth_model.dart';
import 'package:mini_chat/features/auth/data/view_model/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController phoneControler = TextEditingController();
  bool isObscure = true;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  Future<void> signUp({required AuthModel authModel}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      // حساب المستخدم تم إنشاؤه بنجاح
      log("User registered: ${userCredential.user!.email}");
    } catch (e) {
      log("Error: $e");
    }
  }
}
