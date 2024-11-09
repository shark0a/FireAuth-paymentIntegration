import 'package:authtest/Feature/auth/presentation/screens/widgets/login/formfiled.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/login/sign_up_row.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/login/social_icon.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/login/title.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          const LoginTitle(),
          Image.asset('lib/core/assets/images/1.jpg'),
          const SizedBox(
            height: 10,
          ),
          const Formfield(),
          const SizedBox(
            height: 10,
          ),
          Text("OR login with",
              textAlign: TextAlign.center, style: FontStyles.smallstyle),
          const SizedBox(
            height: 10,
          ),
          const SocialIcon(),
          const SizedBox(
            height: 30,
          ),
          const SignUpRow()
        ]),
      ),
    );
  }
}
