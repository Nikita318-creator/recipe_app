import 'package:flutter/material.dart';
import 'package:new_recipes/components/recipe_card.dart';
import 'package:new_recipes/models/recipe_model.dart';

class RecipePageView extends StatefulWidget {
  const RecipePageView({super.key});

  @override
  State<RecipePageView> createState() => _RecipePageViewState();
}

class _RecipePageViewState extends State<RecipePageView> {
  final PageController pageController = PageController(viewportFraction: 0.75);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final position = pageController.page!.round();
      if (currentPage != position) {
        {
          setState(() {
            currentPage = position;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 401,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                active: index == currentPage,
                index: index,
                recipe: recipes[index],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  pageController.animateToPage(
                    currentPage - 1,
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.easeInOutQuad,
                  );
                },
                child: const Text('prev'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.animateToPage(
                    currentPage + 1,
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.easeInOutQuad,
                  );
                },
                child: const Text('next'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
