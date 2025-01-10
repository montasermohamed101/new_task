
import 'package:cleancode/core/network/error/failure.dart';
import 'package:cleancode/features/home/domain/entities/product_entity.dart';

import '../../../../core/network/either.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
