import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/PizzaBloc/bloc/pizzas_bloc.dart';
import 'package:new_recipes/PizzaBloc/models/pizza_model.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizzas Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<PizzasBloc, PizzasState>(
          builder: (context, state) {
            if (state is PizzasInitial) {
              return const CircularProgressIndicator(color: Colors.blueGrey);
            }
            if (state is PizzasLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'pizzas count ${state.pizzas.length}',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (var pizza in state.pizzas)
                          Positioned(
                            left: Random().nextInt(250).toDouble(),
                            right: Random().nextInt(400).toDouble(),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 1.5,
                              width: MediaQuery.of(context).size.width,
                              child: pizza.image,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "add_pizza",
              child: const Icon(Icons.local_pizza),
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                context
                    .read<PizzasBloc>()
                    .add(AddPizza(pizza: PizzaModels.pizzas[0]));
              }),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: "remove_pizza",
              child: const Icon(Icons.remove),
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                context
                    .read<PizzasBloc>()
                    .add(RemovePizza(pizza: PizzaModels.pizzas[0]));
              }),
        ],
      ),
    );
  }
}
