part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class JuanState extends CounterState {
  final int counter;

  JuanState({required this.counter});
  
  @override
  List<Object> get props => [counter]; //Para saber si un objeto es igual a otro usa [counter]
}
