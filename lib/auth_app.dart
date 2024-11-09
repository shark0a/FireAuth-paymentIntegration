import 'package:authtest/Feature/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:authtest/Feature/auth/presentation/repo/auth_repo.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthApp extends StatelessWidget {
  const AuthApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepo>()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Auth App',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
