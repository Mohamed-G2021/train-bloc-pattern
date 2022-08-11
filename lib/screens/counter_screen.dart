import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_cubit/cubit/counter_cubit.dart';
import 'package:train_cubit/cubit/counter_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
          builder: (context, state) => Scaffold(
                appBar: AppBar(
                  title: const Text('Counter Screen'),
                  centerTitle: true,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {
                                CounterCubit.get(context).decreaseCounter();
                              },
                              child: const Text('-',
                                  style: TextStyle(
                                    fontSize: 50,
                                  ))),
                          Text(
                            '${CounterCubit.get(context).itemCounter}',
                            style: const TextStyle(fontSize: 50),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {
                                CounterCubit.get(context).increaseCounter();
                              },
                              child: const Text('+',
                                  style: TextStyle(
                                    fontSize: 50,
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          // style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                          onPressed: () {
                            CounterCubit.get(context).resetCounter();
                          },
                          child: const Text('Reset',
                              style: TextStyle(
                                fontSize: 35,
                              )))
                    ],
                  ),
                ),
              ),
          listener: (context, state) {
            if (state is CounterIncrementState) {}
          }),
    );
  }
}
