import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/home/home_bloc.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import 'components/home_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  HomeBloc? _homeBloc;
  late int pageIndex = 1;

  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return HomeContent(
              pageIndex: pageIndex,
              setPageIndex: (index) {
                _homeBloc?.add(
                  SetPageIndexEvent(index: index),
                );
              },
              onItemTapped: (index) {
                setState(() {
                  pageIndex = index;
                });
                _homeBloc?.add(
                  OnItemTappedEvent(index: index),
                );
              },
              primaryColor: themeState.primaryColor as Color,
              accentColor: themeState.accentColor as Color,
            );
          },
        );
      },
    );
  }
}
