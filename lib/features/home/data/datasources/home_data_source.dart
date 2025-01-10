

import 'package:cleancode/core/network/endpoints.dart';
import 'package:cleancode/features/home/data/models/product_model.dart';

import '../../../../core/network/api_consumer.dart';
import '../../../../core/network/either.dart';
import '../../../../core/network/error/failure.dart';
import '../../domain/entities/product_entity.dart';

abstract class HomeDataSource {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

}


class HomeDataSourceImpl implements HomeDataSource {
  final ApiConsumer _apiConsumer;

  HomeDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts()async {
    const url = "${Endpoints.getProduct}";

    final response = await _apiConsumer.get(url: url);

    return response.fold(
          (l) => Left(l),
          (data) {
        final productData = (data['products'] as List)
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(productData);
      },
    );
  }


}
