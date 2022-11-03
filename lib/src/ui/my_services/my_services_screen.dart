import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/customer/customer_bloc.dart';

import 'my_services_view.dart';

class MyServicesScreen extends StatelessWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => CustomerBloc(),
      child: const MyServicesView(),
    );
  }
}
