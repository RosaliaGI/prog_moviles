import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          // sirve para snackbars, dialogs, etc
          // como no se ocupa se podría cambiar a BlocBuilder
        },
        builder: (context, state) {
          if (state is JuanState) {
            return Center(
              child: Text(
                '${state.counter}',
                style: TextStyle(fontSize: 50),
              ),
            );
          } else {
            return Center(
              child: Text(
                'Indique una opcion',
                style: TextStyle(fontSize: 50),
              ),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: UniqueKey(),
            tooltip: 'Increment',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            key: UniqueKey(),
            tooltip: 'Decrement',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            key: UniqueKey(),
            tooltip: 'Reset',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(ResetEvent());
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
