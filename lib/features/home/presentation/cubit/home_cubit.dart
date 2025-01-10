import 'package:bloc/bloc.dart';
import 'package:cleancode/core/network/error/failure.dart';
import 'package:cleancode/features/home/domain/entities/product_entity.dart';
import 'package:cleancode/features/home/domain/use_case/get_product_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final GetProductUseCase getProductUseCase;
  HomeCubit(this.getProductUseCase) : super(HomeState());

  Future<void> fetchProducts() async {
    emit(state.copyWith(status: StateStatus.loading));

    final result = await getProductUseCase(NoParams());

    result.fold(
          (failure) {
        emit(state.copyWith(
          failure: failure,
          status: StateStatus.error,
        ));
      },
          (productData) {
        emit(state.copyWith(
          status: StateStatus.success,
          productEntity: productData,
        ));
      },
    );
  }
}
