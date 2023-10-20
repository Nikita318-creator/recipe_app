part of 'pizzas_bloc.dart';

sealed class PizzasEvent extends Equatable {
  const PizzasEvent();

  @override
  List<Object> get props => [];
}

final class LoadPizzaCounter extends PizzasEvent {}

final class AddPizza extends PizzasEvent {

  const AddPizza({required this.pizza});
  final PizzaModel pizza;

  @override
  List<Object> get props => [pizza];
}

final class RemovePizza extends PizzasEvent {

  const RemovePizza({required this.pizza});
  final PizzaModel pizza;

  @override
  List<Object> get props => [pizza];
}
