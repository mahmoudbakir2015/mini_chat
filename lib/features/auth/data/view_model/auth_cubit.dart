import 'package:bloc/bloc.dart';
import 'package:mini_chat/features/auth/data/view_model/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
}
