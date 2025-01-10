import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocConsumer<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocWidgetBuilder<S> builder;
  final BlocWidgetListener<S> listener;

  const CustomBlocConsumer({
    super.key,
    required this.builder,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      builder: builder,
      listener: listener,
    );
  }
}
