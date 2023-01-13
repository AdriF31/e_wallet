

import 'package:e_wallet/blocs/auth/auth_event.dart';
import 'package:e_wallet/blocs/auth/auth_state.dart';
import 'package:e_wallet/models/sign_in_form_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terdaftar'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final res = await AuthService().login(event.data);
          emit(AuthSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel res =
              await AuthService().getCredentialFromLocal();
          final UserModel user = await AuthService().login(res);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
