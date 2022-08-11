import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_cubit/cubit/counter_cubit.dart';
import 'package:train_cubit/cubit/counter_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterStates>(
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
                              BlocProvider.of<CounterCubit>(context)
                                  .decreaseCounter(
                                      BlocProvider.of<CounterCubit>(context)
                                          .counter);
                            },
                            child: const Text('-',
                                style: TextStyle(
                                  fontSize: 50,
                                ))),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).counter}',
                          style: const TextStyle(fontSize: 50),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .increaseCounter(
                                      BlocProvider.of<CounterCubit>(context)
                                          .counter);
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
                          BlocProvider.of<CounterCubit>(context).resetCounter(
                              BlocProvider.of<CounterCubit>(context).counter);
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
          if (state is CounterIncrementState) {
            BlocProvider.of<CounterCubit>(context).increaseCounter(
                BlocProvider.of<CounterCubit>(context).counter);
          } else if (state is CounterDecrementState) {
            BlocProvider.of<CounterCubit>(context).decreaseCounter(
                BlocProvider.of<CounterCubit>(context).counter);
          } else {
            BlocProvider.of<CounterCubit>(context)
                .resetCounter(BlocProvider.of<CounterCubit>(context).counter);
          }
        });
  }
}
