import 'package:cleancode/features/home/domain/use_case/get_product_use_case.dart';
import 'package:cleancode/features/home/presentation/cubit/home_cubit.dart';
import 'package:cleancode/service_locator/service_locator.dart';
import 'package:get_it/get_it.dart';

import '../features/home/data/datasources/home_data_source.dart';
import '../features/home/data/repositories/home_repository_impl.dart';
import '../features/home/domain/repositories/home_repository.dart';


class HomeServiceLocator {

  static Future<void> execute({required GetIt sl}) async {
    sl.registerFactory<HomeDataSource>(() => HomeDataSourceImpl(serviceLocator()));
    sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(serviceLocator()));
    sl.registerFactory<GetProductUseCase>(() => GetProductUseCase(serviceLocator()));
    sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
  }
}
