import 'package:authtest/Feature/auth/presentation/manger/function/send_function.dart';
import 'package:authtest/Feature/auth/presentation/repo/auth_repo.dart';
import 'package:authtest/core/utils/shared_prefrance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepoImplement implements AuthRepo {
  AuthRepoImplement();

  @override
  Future<void> login(
    TextEditingController loginEmailController,
    TextEditingController passwordController,
    String vCode,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (credential.user != null) {
        SharedPrefHelper.saveData(
            "EmailAddress", loginEmailController.text.trim());

        // Send the verification code
        String verificationCode = vCode;
        String recipient = 'shar40951@gmail.com';
        String subject = 'Email Verification';
        String body = 'Your verification code is $verificationCode';
        await sendCode(recipient, subject, body);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      } else {
        throw ('Check your email or password.');
      }
    } catch (e) {
      throw ('An error occurred during login. Please try again.');
    }
  }

  @override
  Future<void> register(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      }
    } catch (e) {
      throw ('An error occurred during registration. Please try again.');
    }
  }
}
