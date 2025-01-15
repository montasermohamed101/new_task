import 'package:bloc/bloc.dart';
import 'package:cleancode/core/network/error/failure.dart';
import 'package:cleancode/features/home/domain/entities/product_entity.dart';
import 'package:cleancode/features/home/domain/use_case/get_product_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductUseCase getProductUseCase;

  HomeCubit(this.getProductUseCase) : super(HomeState());

  // Add cities and states
  final List<String> cities = [
    'الإسكندرية',
    'أسوان',
    'الدقهلية',
    'القاهرة',
    'بورسعيد',
    'دمياط',
  ];

  final Map<String, List<String>> states = {
    'الإسكندرية': ['سيدي جابر', 'سموحة', 'كوبري ستانلي', 'المعمورة'],
    'أسوان': ['منطقة 1', 'منطقة 2', 'منطقة 3'],
    'الدقهلية': ['منطقة 4', 'منطقة 5', 'منطقة 6'],
    'القاهرة': ['مدينة نصر', 'التجمع الخامس', 'مصر الجديدة', 'وسط البلد'],
    'بورسعيد': ['منطقة 10', 'منطقة 11', 'منطقة 12'],
    'دمياط': ['منطقة 13', 'منطقة 14', 'منطقة 15'],
  };

  // Add startCity, startState, endCity, endState
  String? startCity;
  String? startState;
  String? endCity;
  String? endState;

  // Add selectedIndex
  int selectedIndex = 0;

  // Add items and icons
  final List<String> items = [
    "تحصيل األموال لقدّا",
    "تحصيل األموال عن طريق الفنيا",
    "األوصيل من الباب للباب",
    "الاستالم عند أقرب فرع",
    "حاويات وأوزان ثقيلة",
    "تعبئة وتفليف الطرور",
    "نقل إحصة كهربائية",
    "خدمات التأمين",
    "بضائع وطرور",
    "منتجات بحاجة للبريد",
    "منتجات قابلة للكسير",
    "مستندات وأوزان خفيفة",
    "خدمات اآلخرين"
  ];

  final List<IconData> icons = [
    Icons.payment,
    Icons.payments_outlined,
    Icons.door_back_door_outlined,
    Icons.location_on_outlined,
    Icons.admin_panel_settings_outlined,
    Icons.gif_box,
    Icons.shield_moon_outlined,
    Icons.electrical_services_sharp,
    Icons.severe_cold,
    Icons.hotel_class_sharp,
    Icons.document_scanner_rounded,
    Icons.store,
    Icons.ac_unit_outlined,
  ];

  // Method to update startCity and startState
  void updateStartLocation(String city, String state) {
    emit(this.state.copyWith( // Use `this.state` to refer to the state of the cubit
      startCity: city,
      startState: state,
    ));
  }

  void updateEndLocation(String city, String state) {
    emit(this.state.copyWith( // Use `this.state` to refer to the state of the cubit
      endCity: city,
      endState: state,
    ));
  }

  // Method to update selectedIndex
  void updateSelectedIndex(int index) {
    selectedIndex = index;
    emit(state.copyWith()); // Emit a new state to trigger UI update
  }

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