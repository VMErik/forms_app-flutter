part of 'counter_cubit.dart';


// Extendemos de equatable, para poder valorar si os objetos cambian
class CounterState extends Equatable{
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
  });

  // Si el counter o transaction cambia, lo copiamos, y si no lo mantenemos
  copyWith({
    int? counter,
    int?  transactionCount
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }
  
  @override
  List<Object> get props => [counter, transactionCount];

}