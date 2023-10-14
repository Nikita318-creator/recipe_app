import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/HeadRow.dart';
import 'package:new_recipes/MainHome/SubHeadRow.dart';
import 'package:new_recipes/MainHome/ListViewMain.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

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
              ListViewMain(state: state),
            ],
          ),
        );
      }),
    );
  }
}
