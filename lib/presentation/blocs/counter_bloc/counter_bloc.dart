import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {

    // Agregamos nuestro escuchados a un evento
    on<CounterIncreased>((event, emit) {
      return _onCounterIncreased(event, emit);
    });

    on<CounterReset>((event, emit) {
      return _onCounterReset(event, emit);
    });
  }

  // Creamos nuestra funcion que se disparara cuando incrementemos el contador
  void _onCounterIncreased(CounterIncreased event , Emitter<CounterState> emit){
    emit( state.copyWith(
        counter: state.counter + event.value,
        transactionCount:  state.transactionCount + 1
      ));  
  }
  // Creamos nuestra funcion que se disparara cuando reseteamos el contador
  void _onCounterReset(CounterReset event , Emitter<CounterState> emit){
    emit( state.copyWith(
        counter: 0,
      ));  
  }

  // Centralizams nuestras llamadas a nuestros eventos
  void increaseBy([int value = 1]){
    add(CounterIncreased(value));
  }

  void resetCounter([int value = 1]){
    add(const CounterReset());
  }
}
