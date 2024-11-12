import 'package:authtest/auth_app.dart';
import 'package:authtest/core/utils/secret_keys.dart';
import 'package:authtest/core/utils/service_locator.dart';
import 'package:authtest/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  Stripe.publishableKey = SecretKeys.publichKey;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const AuthApp());
}
