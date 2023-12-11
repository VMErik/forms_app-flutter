import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( _ )=> CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increseCounterBy(BuildContext context , [int value = 1]){
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    // Tambien podemos acceder de la forma de los otros gestores de estado
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value){
          return Text('Cubit Counter : ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: (){
              // Notificamos el cambio
              context.read<CounterCubit>().reset();
            }, 
            icon: const Icon(Icons.refresh_rounded)
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state){
            print('cambio');
            // Hacemos referencia a nuestro state.counter
            return Text('Counter value : ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: (){
              increseCounterBy(context, 3);
            }
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: (){
              increseCounterBy(context, 2);
            }
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: (){
              increseCounterBy(context, 1);
            }
          )
        ],
      ),
    );
  }
}