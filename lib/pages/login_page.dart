import 'package:flutter/material.dart';
import 'package:new_recipes/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 213,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img-onboarding.png'),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          const Text(
            'Заголовок',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF0E0E2D),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          const Text(
            'Подтекст',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff9A9DB0),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          SingUpButton(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            text: 'Sign Up',
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.5),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class SingUpButton extends StatelessWidget {
  const SingUpButton({
    required this.onTap,
    required this.text,
    super.key,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFf6925c),
              Color(0xFFf37552),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
