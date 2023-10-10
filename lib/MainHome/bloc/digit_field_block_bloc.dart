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
      emit(DigitFieldBlockMinCountTapped(tappedDigits: [event.tappedDigit]));
    } else if (state is DigitFieldBlockMinCountTapped) {
      final state = this.state as DigitFieldBlockMinCountTapped;
      if (state.tappedDigits.length < 8) {
        emit(
          DigitFieldBlockMinCountTapped(
              tappedDigits: List.from(state.tappedDigits)
                ..add(event.tappedDigit)),
        );
        if (state.tappedDigits.length == 7) {
          emit(DigitFieldBlockMaxCountTapped(
              tappedDigits:
                  List.from(state.tappedDigits + [event.tappedDigit])));
        }
      } else {
        emit(
          DigitFieldBlockMaxCountTapped(
              tappedDigits: List.from(state.tappedDigits)),
        );
      }
    }
  }

  void onRemoveDigit(
      RemoveDigit event, Emitter<DigitFieldBlockState> emit) async {
    if (state is DigitFieldBlockMinCountTapped) {
      final state = this.state as DigitFieldBlockMinCountTapped;
      if (state.tappedDigits.length == 1) {
        emit(DigitFieldBlockInitial());
      } else {
        emit(
          DigitFieldBlockMinCountTapped(
              tappedDigits: List.from(state.tappedDigits)
                ..remove(event.tappedDigit)),
        );
      }
    } else if (state is DigitFieldBlockMaxCountTapped) {
      final state = this.state as DigitFieldBlockMaxCountTapped;
      emit(
        DigitFieldBlockMinCountTapped(
            tappedDigits: List.from(state.tappedDigits)
              ..remove(event.tappedDigit)),
      );
    }
  }
}
