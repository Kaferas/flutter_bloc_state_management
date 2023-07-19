// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
 
   // ignore: prefer_const_constructors_in_immutables
   CounterState({
    required this.counter,
  });
  
  factory CounterState.initial(){
    return CounterState(counter:0);
  }

  @override
  String toString()=>'CounterState(counter:$counter)';
  
  @override
  List<Object> get props => [counter];


  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}

