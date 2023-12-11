part of 'counter_bloc.dart';

// Para emitir nuevos estados se hacen con eventos
// AQUI LO HAREMOS

abstract class CounterEvent{
  const CounterEvent();
}
// Evento para incrementar
class CounterIncreased extends CounterEvent {
  final int value ;
  const CounterIncreased(this.value);
}

// Otro evento para resetear
class CounterReset extends CounterEvent {
  const CounterReset();
}