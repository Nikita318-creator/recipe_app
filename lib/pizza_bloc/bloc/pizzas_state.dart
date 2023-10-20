part of 'pizzas_bloc.dart';

sealed class PizzasState extends Equatable {
  const PizzasState();

  @override
  List<Object> get props => [];
}

final class PizzasInitial extends PizzasState {}

final class PizzasLoaded extends PizzasState {

  const PizzasLoaded({required this.pizzas});
  final List<PizzaModel> pizzas;

  @override
  List<Object> get props => [pizzas];
}
