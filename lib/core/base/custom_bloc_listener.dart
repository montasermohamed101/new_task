import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocListener<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocWidgetListener<S> listener;
  final Widget child;
  final B bloc;

  const CustomBlocListener({
    super.key,
    required this.listener,
    required this.child,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      bloc: bloc,
      listener: listener,
      child: child,
    );
  }
}
