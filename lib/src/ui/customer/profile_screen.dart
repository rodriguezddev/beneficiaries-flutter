import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/bloc/profile/profile_bloc.dart';
import '../../core/models/bamba_user.dart';
import 'profile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => ProfileBloc(),
      child: const ProfileView(),
    );
  }
}
