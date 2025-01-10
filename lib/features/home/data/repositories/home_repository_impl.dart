

import 'package:cleancode/core/network/either.dart';

import 'package:cleancode/core/network/error/failure.dart';

import 'package:cleancode/features/home/domain/entities/product_entity.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
   return _homeDataSource.getProducts();
  }

}
