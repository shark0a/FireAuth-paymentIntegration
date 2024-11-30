import 'package:authtest/Feature/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/customize_button.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:authtest/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Formfield extends StatefulWidget {
  const Formfield({super.key});

  @override
  State<Formfield> createState() => _FormfieldState();
}

class _FormfieldState extends State<Formfield> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFAliuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.faliuer)),
          );
        }

        if (state is AuthSuccess) {
          GoRouter.of(context).push(AppRouter.kVerificationScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Code sent! Check your email.")),
          );
          BlocProvider.of<AuthCubit>(context).loginEmailController.clear();
          BlocProvider.of<AuthCubit>(context).loginPasswordController.clear();
        }
      },
      builder: (context, state) {
        final isObscure = BlocProvider.of<AuthCubit>(context).isObscure;

        return Form(
          key: _formKey,
          child: Column(
            children: [
              // Email Address Field
              SizedBox(
                width: 290,
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  controller:
                      BlocProvider.of<AuthCubit>(context).loginEmailController,
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

              // Password Field
              SizedBox(
                width: 290,
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  obscureText: isObscure,
                  controller: BlocProvider.of<AuthCubit>(context)
                      .loginPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .togglePasswordVisibility();
                      },
                    ),
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
                  validator: (value) => ValiditorHelper.validatePassword(value),
                ),
              ),
              const SizedBox(height: 15),

              // Login Button
              state is AuthLoading
                  ? const CircularProgressIndicator()
                  : CustomizeButton(
                      title: "Login",
                      ontap: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<AuthCubit>(context).login();
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
