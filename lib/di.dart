import 'package:flutter_boilerplate/configs/index.dart';
import 'package:flutter_boilerplate/services/navigation/index.dart';
import 'package:flutter_boilerplate/views/index.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> loadDiModules() async {
  // Navigation
  serviceLocator.registerSingleton<NavigationService>(
    NavigationServiceImpl(NavigationRoutes.MAIN),
  );

  // Views
  serviceLocator.registerFactory<MainCubit>(() => MainCubit());
}
