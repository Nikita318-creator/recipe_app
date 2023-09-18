import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_recipes/components/page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7eefb),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.5,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recipes',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0E0E2D),
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: SvgPicture.asset('assets/svg/icon-nav.svg'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16.53,
          ),
          RecipePageView(),
        ],
      )),
    );
  }
}
