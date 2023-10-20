import 'package:equatable/equatable.dart';

class OneTicketModel extends Equatable {

  const OneTicketModel({required this.id, required this.cost});
  final String id;
  final String cost;

  @override
  List<Object?> get props => [id, cost];
}

class OneTicketModelsMoc {
  static List<OneTicketModel> tickets = [
    const OneTicketModel(
      id: '1',
      cost: '2500',
    ),
    const OneTicketModel(
      id: '2',
      cost: '2500',
    ),
    const OneTicketModel(
      id: '3',
      cost: '2500',
    ),
    const OneTicketModel(
      id: '4',
      cost: '2500',
    ),
    const OneTicketModel(
      id: '5',
      cost: '2500',
    )
  ];
}