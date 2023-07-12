part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

// ignore: camel_case_types
class incrementCounterEvent extends CounterEvent{

}


// ignore: camel_case_types
class decrementCounterEvent extends CounterEvent{
  
}