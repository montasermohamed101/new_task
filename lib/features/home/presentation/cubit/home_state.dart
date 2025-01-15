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
  final String? startCity;
  final String? startState;
  final String? endCity;
  final String? endState;
  final int selectedIndex;
  HomeState (
      {
        this.status,
        this.failure,
        this.productEntity,
        this.startCity,
        this.startState,
        this.endCity,
        this.endState,
        this.selectedIndex = 0,
      });

  HomeState  copyWith({
    StateStatus? status,
    Failure? failure,
    List<ProductEntity>? productEntity,
    String? startCity,
    String? startState,
    String? endCity,
    String? endState,
    int? selectedIndex,
  }) {
    return HomeState (
      status: status ?? this.status,
      failure: failure ?? this.failure,
      productEntity: productEntity ?? this.productEntity,
      startCity: startCity ?? this.startCity,
      startState: startState ?? this.startState,
      endCity: endCity ?? this.endCity,
      endState: endState ?? this.endState,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
