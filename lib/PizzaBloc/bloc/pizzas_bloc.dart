import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_recipes/PizzaBloc/models/pizza_model.dart';

part 'pizzas_event.dart';
part 'pizzas_state.dart';

class PizzasBloc extends Bloc<PizzasEvent, PizzasState> {
  PizzasBloc() : super(PizzasInitial()) {
    on<LoadPizzaCounter>(onLoadPizzaCounter);
    on<AddPizza>(onAddPizza);
    on<RemovePizza>(onRemovePizza);
  }

  void onLoadPizzaCounter(
      LoadPizzaCounter event, Emitter<PizzasState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(const PizzasLoaded(pizzas: <PizzaModel>[]));
  }

  void onAddPizza(AddPizza event, Emitter<PizzasState> emit) {
    if (state is PizzasLoaded) {
      final state = this.state as PizzasLoaded;
      emit(
        PizzasLoaded(pizzas: List.from(state.pizzas)..add(event.pizza)),
      );
    }
  }

  void onRemovePizza(RemovePizza event, Emitter<PizzasState> emit) async {
    if (state is PizzasLoaded) {
      final state = this.state as PizzasLoaded;
      emit(
        PizzasLoaded(pizzas: List.from(state.pizzas)..remove(event.pizza)),
      );
    }
  }
}
