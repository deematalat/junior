import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/cubit/cubit.dart';
import 'package:untitled/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Counter"),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: Icon(Icons.add),
                      mini: true,
                    ),
                    Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                          fontSize: 35.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: Icon(Icons.minimize_sharp),
                      mini: true,
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            // if(state is CounterMinusState)print(' minus state ${state.counter}');
            // if(state is CounterPlusState)print('plus state ${state.counter}');
          },
        ));
  }
}
