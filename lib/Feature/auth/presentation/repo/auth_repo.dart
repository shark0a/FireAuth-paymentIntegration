import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<void> login(
    TextEditingController emailController,
    TextEditingController passwordController,
    String vCode,
  );
  Future<void> register(
    TextEditingController emailController,
    TextEditingController passwordController,
  );
}
