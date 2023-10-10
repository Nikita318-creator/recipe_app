import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'digit_field_block_event.dart';
part 'digit_field_block_state.dart';

class DigitFieldBlockBloc
    extends Bloc<DigitFieldBlockEvent, DigitFieldBlockState> {
  DigitFieldBlockBloc() : super(DigitFieldBlockInitial()) {
    // on<OpenDigitField>(onOpenDigitField);
    on<AddDigit>(onAddDigit);
    on<RemoveDigit>(onRemoveDigit);
  }

  // void onOpenDigitField(
  //     OpenDigitField event, Emitter<DigitFieldBlockState> emit) async {
  //   emit(const PizzasLoaded(pizzas: <PizzaModel>[]));
  // }

  void onAddDigit(AddDigit event, Emitter<DigitFieldBlockState> emit) {
    if (state is DigitFieldBlockInitial) {
      final state = this.state as DigitFieldBlockInitial;
      if (state.tappedTickets.length == 0) {
        emit(
            DigitFieldBlockMinCountTapped(tappedTickets: [event.tappedTicket]));
      } else if (state.tappedTickets.length < 8) {
        emit(
          DigitFieldBlockMinCountTapped(
              tappedTickets: List.from(state.tappedTickets)
                ..add(event.tappedTicket)),
        );
      } else {
        emit(
          DigitFieldBlockMaxCountTapped(
              tappedTickets:
                  List.from(state.tappedTickets)), //..add(event.tappedTicket)),
        );
      }
    }
  }

  void onRemoveDigit(
      RemoveDigit event, Emitter<DigitFieldBlockState> emit) async {
    if (state is DigitFieldBlockMinCountTapped) {
      final state = this.state as DigitFieldBlockMinCountTapped;
      if (state.tappedTickets.length == 1) {
        emit(DigitFieldBlockInitial());
      } else {
        emit(
          DigitFieldBlockMinCountTapped(
              tappedTickets: List.from(state.tappedTickets)
                ..remove(event.tappedTicket)),
        );
      }
    }
  }
}
