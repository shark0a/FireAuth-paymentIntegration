import 'package:authtest/Feature/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/customize_button.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:authtest/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthFAliuer) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.faliuer)),
        );
      }
      if (state is AuthSuccess) {
        GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
        BlocProvider.of<AuthCubit>(context).registerEmailController.clear();
        BlocProvider.of<AuthCubit>(context).registerPasswordController.clear();
        usernameController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register  Successfull!")),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 290,
                        child: TextFormField(
                          onTapOutside: (PointerDownEvent event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: FontColors.secColor,
                            labelText: "Username",
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a username";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 290,
                        child: TextFormField(
                          onTapOutside: (PointerDownEvent event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: BlocProvider.of<AuthCubit>(context)
                              .registerEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: FontColors.secColor,
                            labelText: "Email Address",
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) =>
                              ValiditorHelper.validateEmailAddress(value),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 290,
                        child: TextFormField(
                          onTapOutside: (PointerDownEvent event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: BlocProvider.of<AuthCubit>(context)
                              .registerPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: FontColors.secColor,
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) =>
                              ValiditorHelper.validatePassword(value),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 15),
                      state is AuthLoading
                          ? const CircularProgressIndicator()
                          : CustomizeButton(
                              title: "Signup",
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await BlocProvider.of<AuthCubit>(context)
                                      .register();
                                }
                              },
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kLoginScreen);
                        },
                        child: Text(
                          "Already have an account?",
                          style: FontStyles.smallstyle.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: FontColors.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
