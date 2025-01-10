import 'package:cleancode/core/colors/app_colors.dart';
import 'package:cleancode/features/home/presentation/home_screen.dart';
import 'package:cleancode/res/assets/assets.dart';
import 'package:cleancode/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/stateless/custom_check_box.dart';
import 'core/stateless/custom_elevated_button.dart';
import 'core/stateless/custom_gradient_button.dart';
import 'core/stateless/custom_icon_button.dart';
import 'core/stateless/custom_location_button.dart';
import 'core/stateless/custom_radio_tile.dart';
import 'core/stateless/custom_text_form_field.dart';
import 'features/home/presentation/city_selector_screen.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/home/presentation/widgets/check_box_section_widget.dart';
import 'features/home/presentation/widgets/dimensions_input_Section_widget.dart';
import 'features/home/presentation/widgets/location_button_section_widget.dart';
import 'features/home/presentation/widgets/switch_option_section_widget.dart';
import 'features/home/presentation/widgets/weight_input_section_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();
  runApp(Phoenix(child: MyApp()));
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => context.read<HomeCubit>()..fetchProducts(), // Fetch products on startup
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Tajawal',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        home: MainScreen(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl, // Force RTL layout
            child: ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, child!),
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.resize(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ],
              breakpointsLandscape: [
                const ResponsiveBreakpoint.resize(560, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
                const ResponsiveBreakpoint.resize(1024, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1120, name: TABLET),
              ],
            ),
          );
        },
      ),
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: AppColors.lineGrey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.home_icon),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.order_icon),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.person_icon),
            label: 'الحساب',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.more_icon),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }
}