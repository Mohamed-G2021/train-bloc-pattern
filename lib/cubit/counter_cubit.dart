import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_cubit/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  int itemCounter = 0;

  CounterCubit() : super(CounterIncrementState());

  static CounterCubit get(context) => BlocProvider.of(context);
  increaseCounter() {
    itemCounter++;
    emit(CounterIncrementState());
  }

  decreaseCounter() {
    itemCounter--;
    emit(CounterDecrementState());
  }

  resetCounter() {
    itemCounter = 0;
    emit(CounterResetState());
  }
}
