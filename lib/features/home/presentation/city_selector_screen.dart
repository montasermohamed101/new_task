

import 'package:cleancode/core/colors/app_colors.dart';
import 'package:cleancode/core/stateless/custom_radio_tile.dart';
import 'package:cleancode/features/home/presentation/widgets/check_box_section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/dimensions_input_Section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/location_button_section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/switch_option_section_widget.dart';
import 'package:cleancode/features/home/presentation/widgets/weight_input_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/stateless/custom_elevated_button.dart';
import '../../../core/stateless/custom_gradient_button.dart';
import '../../../res/assets/assets.dart';

class CityStateSelector extends StatefulWidget {
  @override
  _CityStateSelectorState createState() => _CityStateSelectorState();
}

class _CityStateSelectorState extends State<CityStateSelector> {
  String? startCity;
  String? startState;
  String? endCity;
  String? endState;

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
    'القاهرة': ['مدينة نصر', 'التجمع الخامس', 'مصر الجديدة','وسط البلد'],
    'بورسعيد': ['منطقة 10', 'منطقة 11', 'منطقة 12'],
    'دمياط': ['منطقة 13', 'منطقة 14', 'منطقة 15'],
  };

  int _selectedIndex = 0;

  void _showStartCityPicker() {
    _showCityPicker((selectedCity) {
      _showStartStatePicker(selectedCity);
    });
  }

  void _showStartStatePicker(String selectedCity) {
    _showStatePicker(selectedCity, (selectedState) {
      setState(() {
        startCity = selectedCity;
        startState = selectedState;
      });
    });
  }

  void _showEndCityPicker() {
    _showCityPicker((selectedCity) {
      _showEndStatePicker(selectedCity);
    });
  }

  void _showEndStatePicker(String selectedCity) {
    _showStatePicker(selectedCity, (selectedState) {
      setState(() {
        endCity = selectedCity;
        endState = selectedState;
      });
    });
  }

  void _showCityPicker(Function(String) onCitySelected) {
    String? tempSelectedCity;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  ...cities.map((city) {
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
                              Navigator.pop(context);
                              onCitySelected(tempSelectedCity!);
                            }
                          },
                          text: 'التالي',
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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

  void _showStatePicker(String selectedCity, Function(String) onStateSelected) {
    String? tempSelectedState;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  ...states[selectedCity]!.map((state) {
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
                              Navigator.pop(context);
                              onStateSelected(tempSelectedState!);
                            }
                          },
                          text: 'التالي',
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
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
              selectedIndex: _selectedIndex,
              onSwitchSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            const SizedBox(height: 24),
            LocationButtonsSection(
              startCity: startCity,
              startState: startState,
              endCity: endCity,
              endState: endState,
              onStartLocationPressed: _showStartCityPicker,
              onEndLocationPressed: _showEndCityPicker,
            ),
            const Divider(
              color: AppColors.simiWhite,
              thickness: 2,
            ),
            const SizedBox(height: 12),
            CheckboxSection(
              value: false,
              onChanged: (value) {},
              label: "تحديد خدمات الشحن",
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
            CheckboxSection(
              value: false,
              onChanged: (value) {},
              label: "طلب مواد تغليف",
            ),
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
  }

}


