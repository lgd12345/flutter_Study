import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_cubit.dart';
import 'counter_view.dart';

//카운터 페이지
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('카운터 페이지입니다.');
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }

}