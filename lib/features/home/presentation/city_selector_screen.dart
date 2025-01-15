

import 'package:cleancode/core/colors/app_colors.dart';
import 'package:cleancode/core/stateless/custom_radio_tile.dart';
import 'package:cleancode/features/home/presentation/widgets/check_box_section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/dimensions_input_Section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/location_button_section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/packing_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/switch_option_section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/weight_input_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/stateless/custom_elevated_button.dart';
import '../../../core/stateless/custom_gradient_button.dart';
import '../../../res/assets/assets.dart';
import '../../../service_locator/service_locator.dart';
import 'cubit/home_cubit.dart';

class CityStateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<HomeCubit>(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final homeCubit = context.read<HomeCubit>();
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: const Text('اختر المدينة والمنطقة'),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchOptionsSection(
                        selectedIndex: state.selectedIndex,
                        onSwitchSelected: (index) {
                          homeCubit.updateSelectedIndex(index);
                        },
                      ),
                      const SizedBox(height: 24),
                      LocationButtonsSection(
                        startCity: state.startCity,
                        startState: state.startState,
                        endCity: state.endCity,
                        endState: state.endState,
                        onStartLocationPressed: () {
                          _showStartCityPicker(context);
                        },
                        onEndLocationPressed: () {
                          _showEndCityPicker(context);
                        },
                      ),
                      const Divider(
                        color: AppColors.simiWhite,
                        thickness: 2,
                      ),
                      const SizedBox(height: 12),
                      CheckboxSection(
                        label: "تحديد خدمات الشحن",
                        items: homeCubit.items,
                        icons: homeCubit.icons,
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        color: AppColors.simiWhite,
                        thickness: 2,
                      ),
                      const SizedBox(height: 27),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "وزن الشحنة",
                              style: TextStyle(
                                color: AppColors.customBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            SvgPicture.asset(Assets.kg_icon),
                          ],
                        ),
                      ),
                      WeightInputSection(
                        onPlusPressed: () {},
                        onMinusPressed: () {},
                        hintText: "ادخل وزن الشحنة بالكيلو",
                      ),
                      const SizedBox(height: 16),
                      DimensionsInputSection(),
                      const SizedBox(height: 16),
                      PackagingMaterialsScreen(),
                      const SizedBox(height: 16),
                      Center(
                        child: GradientButton(
                          onPressed: () {},
                          label: 'بحث',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
  void _showStartCityPicker(BuildContext context) {
    String? tempSelectedCity;
    final homeCubit = context.read<HomeCubit>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.elegantWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اختر المدينة",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.lineGrey,
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: AppColors.lineGrey,
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.lineGrey,
                  ),
                  ...homeCubit.cities.map((city) {
                    return CustomRadioListTile(
                      value: city,
                      groupValue: tempSelectedCity,
                      onChanged: (value) {
                        setModalState(() {
                          tempSelectedCity = value;
                        });
                      },
                      title: city,
                    );
                  }).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            if (tempSelectedCity != null) {
                              Navigator.pop(dialogContext);
                              _showStartStatePicker(context, homeCubit, tempSelectedCity!);
                            }
                          },
                          text: 'التالي',
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text(
                          'السابق',
                          style: TextStyle(
                            color: AppColors.lineGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showStartStatePicker(BuildContext context, HomeCubit homeCubit, String selectedCity) {
    String? tempSelectedState;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.elegantWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...homeCubit.states[selectedCity]!.map((state) {
                    return CustomRadioListTile(
                      value: state,
                      groupValue: tempSelectedState,
                      onChanged: (value) {
                        setModalState(() {
                          tempSelectedState = value;
                        });
                      },
                      title: state,
                    );
                  }).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            if (tempSelectedState != null) {
                              Navigator.pop(dialogContext);
                              homeCubit.updateStartLocation(
                                selectedCity,
                                tempSelectedState!,
                              );
                            }
                          },
                          text: 'التالي',
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text(
                          'السابق',
                          style: TextStyle(
                            color: AppColors.lineGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showEndCityPicker(BuildContext context) {
    String? tempSelectedCity;
    final homeCubit = context.read<HomeCubit>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.elegantWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اختر المدينة",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.lineGrey,
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: AppColors.lineGrey,
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.lineGrey,
                  ),
                  ...homeCubit.cities.map((city) {
                    return CustomRadioListTile(
                      value: city,
                      groupValue: tempSelectedCity,
                      onChanged: (value) {
                        setModalState(() {
                          tempSelectedCity = value;
                        });
                      },
                      title: city,
                    );
                  }).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            if (tempSelectedCity != null) {
                              Navigator.pop(dialogContext);
                              _showEndStatePicker(context, homeCubit, tempSelectedCity!);
                            }
                          },
                          text: 'التالي',
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text(
                          'السابق',
                          style: TextStyle(
                            color: AppColors.lineGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showEndStatePicker(BuildContext context, HomeCubit homeCubit, String selectedCity) {
    String? tempSelectedState;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.elegantWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...homeCubit.states[selectedCity]!.map((state) {
                    return CustomRadioListTile(
                      value: state,
                      groupValue: tempSelectedState,
                      onChanged: (value) {
                        setModalState(() {
                          tempSelectedState = value;
                        });
                      },
                      title: state,
                    );
                  }).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            if (tempSelectedState != null) {
                              Navigator.pop(dialogContext);
                              homeCubit.updateEndLocation(
                                selectedCity,
                                tempSelectedState!,
                              );
                            }
                          },
                          text: 'التالي',
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text(
                          'السابق',
                          style: TextStyle(
                            color: AppColors.lineGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
