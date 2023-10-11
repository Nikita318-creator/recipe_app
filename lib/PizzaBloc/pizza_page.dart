import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/PizzaBloc/bloc/pizzas_bloc.dart';
import 'package:new_recipes/PizzaBloc/PizzaMainView.dart';
import 'package:new_recipes/PizzaBloc/models/pizza_model.dart';

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
