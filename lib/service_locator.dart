import 'package:get_it/get_it.dart';
import 'package:go_router_playground/login_provider.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton(() => LoginProvider());
}

/// Add syntax sugar for quickly accessing the main service locators
LoginProvider get loginProviderLogic => serviceLocator.get<LoginProvider>();
