import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_recipes/features/main_home/data/api_client.dart';
import 'package:new_recipes/features/main_home/domain/error_data.dart';
import 'package:new_recipes/features/main_home/domain/models/requests_data.dart';

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

  final ApiClient apiClient = ApiClient(requestsData: RequestsData());

  void onOpenRandomTicket(
      OpenRandomTicket event, Emitter<DigitFieldBlockState> emit) {
    final state = this.state;
    if (state is DigitFieldBlockMinCountTapped) {
      emit(RandomTicketChosen(tappedDigits: state.tappedDigits));
    } else if (state is DigitFieldBlockMaxCountTapped) {
      emit(RandomTicketChosen(tappedDigits: state.tappedDigits));
    } else if (state is DigitFieldBlockInitial) {
      emit(const RandomTicketChosen(tappedDigits: []));
    }
    // else if (state is OpenRandomTicket) {
    //   final state = this.state as RandomTicketChosen;
    //   emit(RandomTicketChosen(tappedDigits: state.tappedDigits));
    // }
  }

  Future<void> onOpenDigitField(
      OpenDigitField event, Emitter<DigitFieldBlockState> emit) async {
    final responseCode = await apiClient.getData();

    switch (responseCode) {
      case 200:
        // emit(DigitFieldBlockInitial());
        break;
      case 404:
        final ErrorData errorData = ErrorData(errorNumber: '404');
        emit(DigitFieldBlockError(
            errorNumber: errorData.errorNumber,
            errorDescription: errorData.getDescription()));
      default:
        final ErrorData errorData = ErrorData(errorNumber: '404');
        emit(DigitFieldBlockError(
            errorNumber: errorData.errorNumber,
            errorDescription: errorData.getDescription()));
        break;
    }
  }

  Future<void> onMakePayment(
      MakePayment event, Emitter<DigitFieldBlockState> emit) async {
    final responseCode = await apiClient.sendData();
    print('responseCode: ${responseCode}');

    if (responseCode == 200) {
      return;
    } else {
      final errorData = ErrorData(errorNumber: responseCode.toString());
      emit(DigitFieldBlockError(
          errorNumber: errorData.errorNumber,
          errorDescription: errorData.getDescription()));
    }
  }

  void onAddDigit(AddDigit event, Emitter<DigitFieldBlockState> emit) {
    final state = this.state;
    if (state is RandomTicketChosen) {
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
    final state = this.state;
    if (state is DigitFieldBlockMinCountTapped) {
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
      emit(
        DigitFieldBlockMinCountTapped(
            tappedDigits: List.from(state.tappedDigits)
              ..remove(event.tappedDigit)),
      );
    }
  }
}
