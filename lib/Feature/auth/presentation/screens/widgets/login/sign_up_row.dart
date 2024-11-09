import 'package:authtest/Feature/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "don't have an account? ",
          style: FontStyles.smallstyle,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.kSignScreen);
            BlocProvider.of<AuthCubit>(context).loginEmailController.clear();
            BlocProvider.of<AuthCubit>(context).loginPasswordController.clear();
          },
          child: Text(
            "Singup",
            style: FontStyles.smallstyle.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
