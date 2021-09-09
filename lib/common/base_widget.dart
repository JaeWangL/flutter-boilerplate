import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/widget_state.dart';
import 'package:flutter_boilerplate/di.dart';
import 'package:flutter_boilerplate/services/navigation/navigation_service.dart';

abstract class BaseWidget<T extends Cubit<S>, S extends WidgetState>
    extends StatelessWidget {
  final _navigationSvc = serviceLocator<NavigationService>();

  BaseWidget({Key? key}) : super(key: key);

  T getWidgetBloc();

  Widget buildWidget(
    BuildContext context,
    TextDirection direction,
    bool isDarkMode,
  );

  @override
  Widget build(BuildContext context) {
    final TextDirection direction = Directionality.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MultiBlocListener(
      listeners: [
        BlocListener<T, S>(
          bloc: getWidgetBloc(),
          listener: (context, state) {
            if (state is NavigationState) {
              _handleNavigation(context, state);
            }
          },
        ),
      ],
      child: buildWidget(context, direction, isDarkMode),
    );
  }

  void _handleNavigation(BuildContext context, NavigationState state) {
    // MARK: Default is PUSH
    if (state.navigationType == null) {
      _navigationSvc.pushNamed(
        context,
        state.destination,
        state.args,
        popUntilName: state.popUntil,
      );
    }
  }
}
