
import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

class PackagingMaterialsScreen extends StatefulWidget {
  @override
  _PackagingMaterialsScreenState createState() =>
      _PackagingMaterialsScreenState();
}

class _PackagingMaterialsScreenState extends State<PackagingMaterialsScreen> {
  bool isVisible = false;
  int selectedIndex = 0;
  int? selectedItemIndex;
  final Map<int, TextEditingController> _controllers = {};

  @override
  void dispose() {
    _controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: Colors.green,
                value: isVisible,
                onChanged: (value) {
                  setState(() {
                    isVisible = value ?? false;
                  });
                },
              ),
              const Text('طلب مواد تغليف',     style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),),
            ],
          ),
          if (isVisible)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Switch-style selection
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8FE),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFCFD7E2),
                          offset: Offset(-2, 2),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(2, -2),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSwitchOption(
                          text: 'صناديق شحن',
                          index: 0,
                          isSelected: selectedIndex == 0,
                          onTap: () => setState(() => selectedIndex = 0),
                        ),
                        _buildSwitchOption(
                          text: 'أكياس شحن',
                          index: 1,
                          isSelected: selectedIndex == 1,
                          onTap: () => setState(() => selectedIndex = 1),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Content based on selection
                if (selectedIndex == 0)
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.5,
                    children: [
                      _buildItem('صندوق صغير', '44*24*35', 0),
                      _buildItem('صندوق متوسط', '52*25*40', 1),
                      _buildItem('صندوق كبير', '53*37*55', 2),
                    ],
                  ),
                if (selectedIndex == 1)
                  const Center(
                    child: Text('أكياس شحن - لم يتم إضافة عناصر بعد'),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSwitchOption({
    required String text,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
            const BoxShadow(
              color: Color(0xFFCFD7E2),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0, -4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ]
              : [],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.purple : const Color(0xffCFD7E2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget _buildItem(String title, String size, int index) {
    return SizedBox(
      height: 180,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedItemIndex = index;
          });
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedItemIndex == index ? Colors.green : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    color: Colors.orange.shade100,
                    child: const Icon(Icons.inbox, size: 40, color: Colors.orange),
                  ),
                  const SizedBox(height: 5),
                  Text(title),
                  Text(size, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            if (selectedItemIndex == index)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: SizedBox(
                  width: 100,
                  child: TextFormField(
                    controller: _controllers[index] ??= TextEditingController(),
                    decoration: const InputDecoration(
                      labelText: 'ادخل العدد',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }


}

