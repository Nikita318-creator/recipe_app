import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/features/main_home/bloc/digit_field_block_bloc.dart';
import 'package:new_recipes/features/main_home/presentetion/head_row.dart';
import 'package:new_recipes/features/main_home/presentetion/list_view_main.dart';
import 'package:new_recipes/features/main_home/presentetion/list_view_random.dart';
import 'package:new_recipes/features/main_home/presentetion/sub_head_row.dart';

class LotoView extends StatelessWidget {
  const LotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DigitFieldBlockBloc())],
      child: BlocBuilder<DigitFieldBlockBloc, DigitFieldBlockState>(
          builder: (context, state) {
        return Container(
          color: const Color(0xff2e3650), // общий цвет
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.sizeOf(context).width - 50,
                ),
              ),
              const HeadRow(),
              Container(
                color: Colors.grey,
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.sizeOf(context).width - 50,
                ),
              ),
              const SubHeadRow(),
              if (state is RandomTicketChosen)
                const SizedBox(
                  height: 20,
                )
              else
                const SizedBox(
                  height: 0,
                ),
              if (state is RandomTicketChosen)
                const Text(
                  'Выбор случайных билетов',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              else
                const SizedBox(
                  height: 0,
                ),
              if (state is RandomTicketChosen)
                const SizedBox(
                  height: 10,
                )
              else
                const SizedBox(
                  height: 0,
                ),
              if (state is RandomTicketChosen)
                const Text(
                  'Больше билетов — больше шансов',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                )
              else
                const SizedBox(
                  height: 0,
                ),
              if (state is RandomTicketChosen)
                const SizedBox(
                  height: 20,
                )
              else
                const SizedBox(
                  height: 0,
                ),
              if (state is RandomTicketChosen)
                ListViewRandom(state: state)
              else
                ListViewMain(state: state),
            ],
          ),
        );
      }),
    );
  }
}
