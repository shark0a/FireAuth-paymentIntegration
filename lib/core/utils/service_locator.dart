import 'package:authtest/Feature/auth/presentation/repo/auth_repo.dart';
import 'package:authtest/Feature/auth/presentation/repo/auth_repo_implement.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImplement());
}

