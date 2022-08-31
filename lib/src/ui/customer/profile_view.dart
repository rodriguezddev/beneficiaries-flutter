import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/bloc/profile/profile_bloc.dart';
import '../../core/constants/bamba_routes.dart';
import '../../core/utils/base_status.dart';
import '../kommons/bamba_layout.dart';
import '../kommons/screen_loading_logo.dart';
import 'components/profile_content.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  ProfileBloc? _profileBloc;
  AuthBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = context.read<ProfileBloc>();
    _authBloc = context.read<AuthBloc>();
    final userId = _authBloc?.state.user?.id;
    //if (userId != null) {
    _profileBloc?.add(GetProfileEvent(userId: "userId"));
    //}
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == BaseStatus.unauthenticated) {
          _sendToLoginScreen();
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.status) {
            case BaseStatus.initialized:
            case BaseStatus.failed:
            case BaseStatus.success:
              return kIsWeb
                  ? ProfileContent(
                bambaUser: state.user,
                services: state.myServices,
                onCancelService: (String serviceId) {
                },
              )
                  : BambaLayout(
                child: ProfileContent(
                  bambaUser: state.user,
                  services: state.myServices,
                  onCancelService: (String serviceId) {
                    _profileBloc?.add(EditProfileEvent(userId: serviceId));
                  },
                ),
              );
            case BaseStatus.onRequest:
            case BaseStatus.loading:
            case BaseStatus.uninitialized:
              return const ScreenLoadingLogo();
            default:
            //TODO: create an error page
              return Container();
          }
        },
      ),
    );
  }

  void _sendToLoginScreen() {
    Navigator.pushReplacementNamed(
      context,
      BambaRoutes.login,
    );
  }
}
