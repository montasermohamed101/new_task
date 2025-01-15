import 'package:cleancode/core/colors/app_colors.dart';
import 'package:cleancode/features/home/presentation/city_selector_screen.dart';
import 'package:cleancode/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/assets/assets.dart';
import '../../../service_locator/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.white,
        elevation: 4,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CityStateSelector()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(Assets.location_icon,color: AppColors.burntOrange,height: 25,width: 25,),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) =>  serviceLocator<HomeCubit>()..fetchProducts(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == StateStatus.error) {
              return Center(child: Text('Error: ${state.failure?.message}'));
            } else if (state.status == StateStatus.success) {
              final products = state.productEntity;
              return ListView.builder(
                itemCount: products?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = products![index];
                  return ListTile(
                    leading: Image.network(
                      product.thumbnail!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.title ?? 'No Title'),
                    subtitle: Text(product.description ?? 'No Description'),
                    trailing: Text('\$${product.price}'),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
