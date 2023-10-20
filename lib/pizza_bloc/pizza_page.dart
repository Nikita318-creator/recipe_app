import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/pizza_bloc/PizzaMainView.dart';
import 'package:new_recipes/pizza_bloc/bloc/pizzas_bloc.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PizzasBloc()..add(LoadPizzaCounter())),
      ],
      child: const PizzaMainView(),
    );
  }
}
