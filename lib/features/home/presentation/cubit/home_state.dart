part of 'home_cubit.dart';
enum StateStatus {
  initial,
  loading,
  success,
  updated,
  error,
}

class HomeState  {
  final StateStatus? status;
  final Failure? failure;
  final List<ProductEntity>? productEntity;
  HomeState (
      {
        this.status,
        this.failure,
        this.productEntity,
      });

  HomeState  copyWith({
    StateStatus? status,
    Failure? failure,
    List<ProductEntity>? productEntity,
  }) {
    return HomeState (
      status: status ?? this.status,
      failure: failure ?? this.failure,
      productEntity: productEntity ?? this.productEntity,

    );
  }
}
