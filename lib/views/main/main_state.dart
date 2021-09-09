part of 'main_cubit.dart';

abstract class MainState extends WidgetState {
  const MainState();
}

class MainTabChangedState extends MainState {
  final int index;

  const MainTabChangedState(this.index);

  @override
  List<Object?> get props => [index];
}
