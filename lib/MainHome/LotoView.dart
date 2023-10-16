import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/HeadRow.dart';
import 'package:new_recipes/MainHome/SubHeadRow.dart';
import 'package:new_recipes/MainHome/ListViewMain.dart';
import 'package:new_recipes/MainHome/ListViewRandom.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';
import 'package:name/theme/app_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LotoView extends StatelessWidget {
  const LotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DigitFieldBlockBloc())],
      child: BlocBuilder<DigitFieldBlockBloc, DigitFieldBlockState>(
          builder: (context, state) {
        return Container(
          color: Color(0xff2e3650), // общий цвет
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
              SubHeadRow(),
              state is RandomTicketChosen
                  ? SizedBox(
                      height: 20,
                    )
                  : SizedBox(
                      height: 0,
                    ),
              state is RandomTicketChosen
                  ? Text(
                      'Выбор случайных билетов',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              state is RandomTicketChosen
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(
                      height: 0,
                    ),
              state is RandomTicketChosen
                  ? Text(
                      'Больше билетов — больше шансов',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              state is RandomTicketChosen
                  ? SizedBox(
                      height: 20,
                    )
                  : SizedBox(
                      height: 0,
                    ),
              state is RandomTicketChosen
                  ? ListViewRandom(state: state)
                  : ListViewMain(state: state),
            ],
          ),
        );
      }),
    );
  }
}
