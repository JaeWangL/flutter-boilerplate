import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/index.dart';
import 'package:flutter_boilerplate/di.dart';
import 'package:flutter_boilerplate/styles/index.dart';
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
    ui.TextDirection direction,
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
      backgroundColor: Colors.transparent,
      unselectedItemColor: AppColors.gray400,
      selectedItemColor: AppColors.primary,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: _onItemTap,
      items: [
        BottomNavigationBarItem(
            icon: const BottomNavIcon(source: 'assets/icons/ic_tab_home.svg'),
            activeIcon: const BottomNavIcon(
                source: 'assets/icons/ic_tab_home.svg', isActive: true),
            label: "common.tabHome".tr()),
        BottomNavigationBarItem(
            icon:
                const BottomNavIcon(source: 'assets/icons/ic_tab_shuttle.svg'),
            activeIcon: const BottomNavIcon(
                source: 'assets/icons/ic_tab_shuttle.svg', isActive: true),
            label: "common.tabShuttle".tr()),
        BottomNavigationBarItem(
            icon: const BottomNavIcon(source: 'assets/icons/ic_tab_diet.svg'),
            activeIcon: const BottomNavIcon(
                source: 'assets/icons/ic_tab_diet.svg', isActive: true),
            label: "common.tabDiet".tr()),
        BottomNavigationBarItem(
            icon:
                const BottomNavIcon(source: 'assets/icons/ic_tab_notices.svg'),
            activeIcon: const BottomNavIcon(
                source: 'assets/icons/ic_tab_notices.svg', isActive: true),
            label: "common.tabNotices".tr()),
        BottomNavigationBarItem(
            icon:
                const BottomNavIcon(source: 'assets/icons/ic_tab_settings.svg'),
            activeIcon: const BottomNavIcon(
                source: 'assets/icons/ic_tab_settings.svg', isActive: true),
            label: "common.tabSettings".tr()),
      ],
    );
  }

  void _onItemTap(int index) {
    _cubit.changeTab(index);
  }
}
