import 'package:authtest/Feature/auth/presentation/screens/widgets/customize_button.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompletedScreen extends StatelessWidget {
  CompletedScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: [
            IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  _auth.signOut().then((value) {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kLoginScreen);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Logout Successfuly ")),
                    );
                  });
                })
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Account Created",
            style: FontStyles.titlestyle.copyWith(fontSize: 20),
          ),
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "lib/core/assets/images/3.jpg",
            ),
            const SizedBox(
              height: 30,
            ),
            Row(children: [
              Text(
                "Hi There,",
                style:
                    FontStyles.titlestyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ]),
            const SizedBox(height: 30),
            Text(
              "Complete your profile to get a \n presonalized feeds ",
              style: FontStyles.titlestyle.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            CustomizeButton(
                ontap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kCartScreen);
                },
                title: "Complete Profile"),
            const SizedBox(
              height: 30,
            ),
            Text(
              "skip",
              style: FontStyles.smallstyle
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
