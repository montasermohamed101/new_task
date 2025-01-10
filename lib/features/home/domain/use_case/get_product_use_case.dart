
import 'package:cleancode/features/home/domain/entities/product_entity.dart';
import 'package:cleancode/features/home/domain/repositories/home_repository.dart';

import '../../../../core/base/base_use_case.dart';
import '../../../../core/network/either.dart';
import '../../../../core/network/error/failure.dart';


class GetProductUseCase extends BaseUseCase<List<ProductEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetProductUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return _homeRepository.getProducts(); // Ensure this method exists in the repository
  }
}
