import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_recipes/models/recipe_model.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({required this.recipes, super.key});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return RecipeItem(
            index: index,
          );
        },
      ),
    );
  }
}

class RecipeItem extends StatelessWidget {
  const RecipeItem({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(children: [
        Container(
          height: 53.43,
          width: 73,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/img-chicken-fajitas.webp',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 18.56,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                recipes[index].recipeName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0E0E2D),
                ),
              ),
              Text(
                '${recipes[index].recipeMaker}\'s recipe',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9A9DB0),
                ),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 15,
              child: Text(
                recipes[index].recipeMaker[0],
                style: TextStyle(color: recipes[index].startColor),
              ),
              backgroundColor: recipes[index].endColor,
            ),
            const Spacer(),
            Row(
              children: [
                SvgPicture.asset('assets/svg/icon-share-grey.svg'),
                const SizedBox(
                  width: 7.65,
                ),
                SvgPicture.asset('assets/svg/icon-bookmark-grey.svg'),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
