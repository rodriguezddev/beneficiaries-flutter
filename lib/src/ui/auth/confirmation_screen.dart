import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/confirmation/confirmation_bloc.dart';
import 'confirmation_view.dart';


class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => ConfirmationBloc(),
      child: const ConfirmationView(),
    );
  }
}
