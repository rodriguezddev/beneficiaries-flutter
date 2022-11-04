import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/customer/customer_bloc.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import 'components/chat_content.dart';

class ChatView extends StatelessWidget  {
  const ChatView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            return ChatContent(
              accentColor: themeState.accentColor as Color,
              textColor: themeState.textColor as Color,
              bambaUser: state.user,
            );
          },
        );
      },
    );
  }
}
