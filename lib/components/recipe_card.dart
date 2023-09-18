import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_recipes/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key, this.active, this.index, this.recipe})
      : super(key: key);

  final bool? active;
  final int? index;
  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    final blur = active! ? 16.0 : 0.0;
    final offset = active! ? 4.0 : 0.0;
    // final top = active! ? 0.0 : 46.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: recipe!.startColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            blurRadius: blur,
            offset: Offset(0, offset),
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/${recipe!.recipeImage}'),
        ),
      ),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                  colors: [
                    recipe!.startColor!,
                    recipe!.endColor!.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  stops: const [0.1, 0.6])),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 16,
              top: 10,
            ),
            height: 87,
            decoration: BoxDecoration(
                color: recipe!.startColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                )),
            child: Text(
              recipe!.recipeName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.5,
                    vertical: 5,
                  ),
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Text(
                    'Recipe',
                    style: TextStyle(
                      fontSize: 13,
                      color: recipe!.startColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/icon-share.svg'),
                    const SizedBox(
                      width: 8.65,
                    ),
                    SvgPicture.asset('assets/svg/icon-bookmark.svg'),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
