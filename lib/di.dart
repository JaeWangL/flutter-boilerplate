import 'package:flutter_boilerplate/configs/index.dart';
import 'package:flutter_boilerplate/data/apis/index.dart';
import 'package:flutter_boilerplate/data/caching/index.dart';
import 'package:flutter_boilerplate/data/dio_interceptor.dart';
import 'package:flutter_boilerplate/data/repositories/index.dart';
import 'package:flutter_boilerplate/domain/useCases/index.dart';
import 'package:flutter_boilerplate/services/navigation/index.dart';
import 'package:flutter_boilerplate/views/index.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> loadDiModules() async {
  // API
  serviceLocator.registerSingleton(DioInterceptor());
  serviceLocator.registerSingleton(DietApi(serviceLocator<DioInterceptor>().getDioInstance()));

  // Caching
  serviceLocator.registerSingleton<DietCaching>(DietCachingImpl());

  // Repositories
  serviceLocator.registerFactory<DietRepository>(() => DietRepositoryImpl(
    serviceLocator.get<DietApi>(), serviceLocator.get<DietCaching>()));

  // UseCases
  serviceLocator.registerFactory<GetDietSocietyUseCase>(
    () => GetDietSocietyUseCaseImpl(serviceLocator.get<DietRepository>()));
  
  // Navigation
  serviceLocator.registerSingleton<NavigationService>(
    NavigationServiceImpl(NavigationRoutes.MAIN),
  );

  // Views
  serviceLocator.registerFactory<MainCubit>(() => MainCubit());
  serviceLocator.registerFactory<DietCubit>(() => DietCubit(
    serviceLocator.get<GetDietSocietyUseCase>(),
  ));
}
