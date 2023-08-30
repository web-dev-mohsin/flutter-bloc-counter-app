import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:bloc_counter_app/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: BlocBuilder<CounterCubit, CounterCubitState>(
            builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterValueUpdated)
                    ? Text(
                        state.counter.toString(),
                        style: textStyle,
                      )
                    : Text(
                        "0",
                        style: textStyle,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterIncrease();
                      },
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterDecrease();
                      },
                      child: Icon(Icons.remove),
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }
}
