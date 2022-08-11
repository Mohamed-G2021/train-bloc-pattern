import 'package:bloc/bloc.dart';
import 'package:train_cubit/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  int counter = 0;

  CounterCubit(initialState) : super(CounterIncrementState());

  increaseCounter(counter) {
    counter++;
    emit(CounterIncrementState());
  }

  decreaseCounter(counter) {
    counter--;
    emit(CounterDecrementState());
  }

  resetCounter(counter) {
    counter = 0;
    emit(CounterResetState());
  }
}
