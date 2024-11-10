import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/auth/data/view_model/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
}
