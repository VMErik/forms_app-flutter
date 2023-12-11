part of 'counter_bloc.dart';

// Aqui definiremos nuestro estado (propiedades)

 class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({this.counter=10, this.transactionCount= 0});

  CounterState copyWith({
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
//  Definimos las propuiedades que seran evaluadas para ver si hay cambio de estad
  List<Object> get props => [counter, transactionCount];
}
