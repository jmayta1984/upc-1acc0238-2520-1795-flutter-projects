import 'dart:async';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/auth/domain/repositories/login_repository.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({required this.repository}) : super(LoginState()) {
    on<OnEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );

    on<OnPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );

    on<TogglePasswordVisibility>(
      (event, emit) =>
          emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible)),
    );

    on<Login>(_login);
  }

  FutureOr<void> _login(Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await repository.login(state.email, state.password);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
