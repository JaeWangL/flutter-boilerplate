import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/index.dart';
import 'package:flutter_boilerplate/di.dart';
import 'package:flutter_boilerplate/views/main/main_cubit.dart';
import 'package:flutter_boilerplate/views/main/widgets/bottom_nav_icon.dart';
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
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
      unselectedItemColor: Colors.red,
      selectedItemColor: Colors.blue,
      onTap: _onItemTap,
      items: const [
        BottomNavigationBarItem(
            icon: BottomNavIcon(source: 'assets/icons/ic_tab_home.svg'),
            activeIcon: BottomNavIcon(
                source: 'assets/icons/ic_tab_home.svg', isActive: true),
            label: "Home"),
        BottomNavigationBarItem(
            icon: BottomNavIcon(source: 'assets/icons/ic_tab_shuttle.svg'),
            activeIcon: BottomNavIcon(
                source: 'assets/icons/ic_tab_shuttle.svg', isActive: true),
            label: "Shuttle"),
        BottomNavigationBarItem(
            icon: BottomNavIcon(source: 'assets/icons/ic_tab_diet.svg'),
            activeIcon: BottomNavIcon(
                source: 'assets/icons/ic_tab_diet.svg', isActive: true),
            label: "Diet"),
        BottomNavigationBarItem(
            icon: BottomNavIcon(source: 'assets/icons/ic_tab_notices.svg'),
            activeIcon: BottomNavIcon(
                source: 'assets/icons/ic_tab_notices.svg', isActive: true),
            label: "Notices"),
        BottomNavigationBarItem(
            icon: BottomNavIcon(source: 'assets/icons/ic_tab_settings.svg'),
            activeIcon: BottomNavIcon(
                source: 'assets/icons/ic_tab_settings.svg', isActive: true),
            label: "Settings"),
      ],
    );
  }

  void _onItemTap(int index) {
    _cubit.changeTab(index);
  }
}
