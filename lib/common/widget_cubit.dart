import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/widget_state.dart';

abstract class WidgetCubit<T extends WidgetState> extends Cubit<T> {
  WidgetCubit(T initialState) : super(initialState);
}
