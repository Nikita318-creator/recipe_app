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
      emit(RandomTicketChosen.map(
          state.tappedDigits[event.ticketId] ?? [], event.ticketId));
    } else if (state is DigitFieldBlockMaxCountTapped) {
      final state = this.state as DigitFieldBlockMaxCountTapped;
      emit(RandomTicketChosen.map(
          state.tappedDigits[event.ticketId] ?? [], event.ticketId));
    } else if (state is DigitFieldBlockInitial) {
      emit(RandomTicketChosen.map(const [], event.ticketId));
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
        emit(DigitFieldBlockError(
            numberError: '404',
            errorDescription:
                'The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible'));
        break;
      default:
        emit(DigitFieldBlockError(
            numberError: '', errorDescription: 'Unknown ERROR'));
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
        emit(DigitFieldBlockMinCountTapped.map(
            List.from(state.tappedDigits[event.ticketId] ?? [])
              ..add(event.tappedDigit),
            event.ticketId));
        if (state.tappedDigits.length == 7) {
          emit(DigitFieldBlockMaxCountTapped.map(
              List.from(state.tappedDigits[event.ticketId] ??
                  [] + [event.tappedDigit]),
              event.ticketId));
        }
      } else {
        emit(
          DigitFieldBlockMaxCountTapped.map(
              List.from(state.tappedDigits[event.ticketId] ?? []),
              event.ticketId),
        );
      }
    } else if (state is DigitFieldBlockInitial) {
      emit(DigitFieldBlockMinCountTapped.map(
          [event.tappedDigit], event.ticketId));
    } else if (state is DigitFieldBlockMinCountTapped) {
      final state = this.state as DigitFieldBlockMinCountTapped;
      if ((state.tappedDigits[event.ticketId] ?? []).length < 8) {
        emit(
          DigitFieldBlockMinCountTapped.map(
              List.from(state.tappedDigits[event.ticketId] ?? [])
                ..add(event.tappedDigit),
              event.ticketId),
        );
        if (state.tappedDigits.length == 7) {
          emit(DigitFieldBlockMaxCountTapped.map(
              List.from(state.tappedDigits[event.ticketId] ??
                  [] + [event.tappedDigit]),
              event.ticketId));
        }
      } else {
        emit(
          DigitFieldBlockMaxCountTapped.map(
              List.from(state.tappedDigits[event.ticketId] ?? []),
              event.tappedDigit),
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
          DigitFieldBlockMinCountTapped.map(
              List.from(state.tappedDigits[event.ticketId] ?? [])
                ..remove(event.tappedDigit),
              event.ticketId),
        );
      }
    } else if (state is DigitFieldBlockMaxCountTapped) {
      final state = this.state as DigitFieldBlockMaxCountTapped;
      emit(
        DigitFieldBlockMinCountTapped.map(
            List.from(state.tappedDigits[event.ticketId] ?? [])
              ..remove(event.tappedDigit),
            event.ticketId),
      );
    }
  }
}
