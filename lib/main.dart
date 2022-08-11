import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_cubit/cubit/counter_cubit.dart';
import 'package:train_cubit/cubit/counter_states.dart';
import 'package:train_cubit/screens/counter_screen.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(CounterIncrementState()),
      child: const MaterialApp(
        home: CounterScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
