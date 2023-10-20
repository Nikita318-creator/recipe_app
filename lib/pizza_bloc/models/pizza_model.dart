import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class PizzaModel extends Equatable {

  const PizzaModel({required this.id, required this.name, required this.image});
  final String id;
  final String name;
  final Image image;

  @override
  List<Object?> get props => [id, name, image];
}

class PizzaModels {
  static List<PizzaModel> pizzas = [
    PizzaModel(
        id: '1',
        name: 'Pepperoni',
        image: Image.asset('assets/images/pizza1.jpg')),
    PizzaModel(
        id: '2',
        name: 'Hawaii',
        image: Image.asset('assets/images/pizza2.jpg')),
  ];
}
