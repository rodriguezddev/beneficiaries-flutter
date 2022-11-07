import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/customer/customer_bloc.dart';
import 'profile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => CustomerBloc(),
      child: const ProfileView(),
    );
  }
}
