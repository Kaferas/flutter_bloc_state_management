// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<incrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter:state.counter+1));
    });
    on<decrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter:state.counter-1));
    });
  }
}
