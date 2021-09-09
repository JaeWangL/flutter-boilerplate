import 'package:flutter_boilerplate/common/index.dart';

part 'main_state.dart';

class MainCubit extends WidgetCubit<MainState> {
  MainCubit() : super(const MainTabChangedState(0));

  void changeTab(int index) => emit(MainTabChangedState(index));
}
