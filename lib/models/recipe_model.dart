import 'package:flutter/material.dart';

class Recipe {
  Recipe({
    this.recipeName = '',
    this.recipeImage = '',
    this.recipeMaker = '',
    this.startColor,
    this.endColor,
  });

  String recipeName;
  String recipeImage;
  String recipeMaker;
  Color? startColor;
  Color? endColor;
}

var recipes = [
  Recipe(
    recipeName: 'Vegan Apricot Tart',
    recipeImage: 'img-vegan-apricot-tart.jpeg',
    recipeMaker: 'Foodie Yuki',
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  ),
  Recipe(
    recipeName: 'Chorizo & mozzarella gnocchi bake',
    recipeImage: 'img-gnocchi.webp',
    recipeMaker: 'Marianne Turner',
    startColor: const Color(0xFF621e14),
    endColor: const Color(0xFFd13b10),
  ),
  Recipe(
    recipeName:
        'Easy classic lasagne Easy classic lasagne Easy classic lasagne',
    recipeImage: 'img-classic-lasange.webp',
    recipeMaker: 'Angela Boggiano',
    startColor: const Color(0xFFaf781d),
    endColor: const Color(0xFFd6a651),
  ),
];
