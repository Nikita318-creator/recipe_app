import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_recipes/domain/api_clients/api_client.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';

part 'digit_field_block_event.dart';
part 'digit_field_block_state.dart';

class DigitFieldBlockBloc
    extends Bloc<DigitFieldBlockEvent, DigitFieldBlockState> {
  DigitFieldBlockBloc() : super(DigitFieldBlockInitial()) {
    on<OpenDigitField>(onOpenDigitField);
    on<OpenRandomTicket>(onOpenRandomTicket);
    on<AddDigit>(onAddDigit);
    on<RemoveDigit>(onRemoveDigit);
    on<MakePayment>(onMakePayment);
  }

  var apiClient = ApiClient();

  void onOpenRandomTicket(
      OpenRandomTicket event, Emitter<DigitFieldBlockState> emit) {
    if (state is DigitFieldBlockMinCountTapped) {
      final state = this.state as DigitFieldBlockMinCountTapped;
      emit(RandomTicketChosen(tappedDigits: state.tappedDigits));
    } else if (state is DigitFieldBlockMaxCountTapped) {
      final state = this.state as DigitFieldBlockMaxCountTapped;
      emit(RandomTicketChosen(tappedDigits: state.tappedDigits));
    } else if (state is DigitFieldBlockInitial) {
      emit(const RandomTicketChosen(tappedDigits: []));
    }
    // else if (state is OpenRandomTicket) {
    //   final state = this.state as RandomTicketChosen;
    //   emit(RandomTicketChosen(tappedDigits: state.tappedDigits));
    // }
  }

  void onOpenDigitField(
      OpenDigitField event, Emitter<DigitFieldBlockState> emit) async {
    int responseCode = await apiClient.getData();
    switch (responseCode) {
      case 200:
        // emit(DigitFieldBlockInitial());
        break;
      case 404:
        emit(DigitFieldBlockError());
        break;
      default:
        emit(DigitFieldBlockError());
        print('Unknown ERROR');
        break;
    }
  }

  void onMakePayment(
      MakePayment event, Emitter<DigitFieldBlockState> emit) async {
    // TODO: - Manage state in the future:
    int responseCode = await apiClient.sendData();
    switch (responseCode) {
      case 200:
        print('OK');
        break;
      case 404:
        print(
            'The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.');
        break;
      default:
        print('Unknown ERROR');
        break;
    }

    emit(DigitFieldBlockInitial());
  }

  void onAddDigit(AddDigit event, Emitter<DigitFieldBlockState> emit) {
    if (state is RandomTicketChosen) {
      final state = this.state as RandomTicketChosen;
      if (state.tappedDigits.isEmpty) {
        emit(DigitFieldBlockInitial());
      } else if (state.tappedDigits.length < 8) {
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
    } else if (state is DigitFieldBlockInitial) {
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

  void onRemoveDigit(RemoveDigit event, Emitter<DigitFieldBlockState> emit) {
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
