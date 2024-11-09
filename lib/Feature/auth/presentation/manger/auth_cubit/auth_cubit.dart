import 'dart:math';

import 'package:authtest/Feature/auth/presentation/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  String? vCode = "";
  final AuthRepo authRepo;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();

  bool isObscure = true;
  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(AuthPasswordVisibilityChanged(isObscure));
  }

  Future<void> generateCode() async {
    int code = (Random().nextInt(999999) + 153200);
    if ((code.toString()).length < 6 || (code.toString()).length > 6) {
      code = (Random().nextInt(999999) + 153200);
    } else {
      vCode = code.toString();
    }
  }

  Future<void> login() async {
    emit(AuthLoading());
    await generateCode();
    try {
      await authRepo
          .login(
              loginEmailController, loginPasswordController, vCode.toString())
          .then(
        (value) {
          emit(AuthSuccess());
        },
      );
    } catch (e) {
      emit(AuthFAliuer(faliuer: e.toString()));
    }
  }

  Future<void> register() async {
    emit(AuthLoading());
    try {
      await authRepo
          .register(
        registerEmailController,
        registerPasswordController,
      )
          .then((value) {
        emit(AuthSuccess());
      });
    } catch (e) {
      emit(AuthFAliuer(faliuer: e.toString()));
    }
  }
}
