import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/index.dart';
import 'package:flutter_boilerplate/di.dart';
import 'package:flutter_boilerplate/views/main/main_cubit.dart';

import 'tabViews/index.dart';

class MainView extends BaseWidget<MainCubit, MainState> {
  final MainCubit _cubit = serviceLocator.get<MainCubit>();
  final VoidCallback onToggleTheme;
  final _tabViews = [
    const HomeView(),
    const ShuttleView(),
    const DietView(),
    const NoticesView(),
    const SettingsView(),
  ];

  MainView(this.onToggleTheme, {Key? key}) : super(key: key);

  @override
  MainCubit getWidgetBloc() => _cubit;

  @override
  Widget buildWidget(
    BuildContext context,
    TextDirection direction,
    bool isDarkMode,
  ) {
    return BlocBuilder(
      bloc: _cubit,
      buildWhen: (previousState, currentState) {
        return previousState != currentState;
      },
      builder: (BuildContext context, MainState state) {
        if (state is MainTabChangedState) {
          return Scaffold(
            body: _buildBody(state.index),
            bottomNavigationBar: _buildBottomNav(state.index),
          );
        }

        return Container(color: Colors.white);
      },
    );
  }

  Widget _buildBody(int index) {
    return _tabViews.elementAt(index);
  }

  Widget _buildBottomNav(int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTap,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.date_range), label: "Shuttle"),
        const BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Diet"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.notification_important), label: 'Notices'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: "Settings"),
      ],
    );
  }

  void _onItemTap(int index) {
    _cubit.changeTab(index);
  }
}
