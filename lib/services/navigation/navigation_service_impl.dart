import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/configs/index.dart';
import 'package:flutter_boilerplate/services/navigation/navigation_service.dart';
import 'package:flutter_boilerplate/views/index.dart';

class NavigationServiceImpl extends NavigationService {
  NavigationServiceImpl(String initialRoute) : super(initialRoute);

  @override
  Map<String, WidgetBuilder> initializeNavigationRoutes(
    BuildContext context, {
    required VoidCallback onToggleTheme,
  }) =>
      {
        // MARK: Add extra views here
        NavigationRoutes.MAIN: (context) => MainView(onToggleTheme),
      };

  @override
  void pop(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void popAndPushNamed(BuildContext context, String destination, dynamic args) {
    Navigator.of(context).popAndPushNamed(destination, arguments: args);
  }

  @override
  void pushReplacementNamed(
      BuildContext context, String destination, dynamic args) {
    Navigator.of(context).pushReplacementNamed(destination, arguments: args);
  }

  @override
  Future<Object?> pushNamed(
      BuildContext context, String destination, dynamic args,
      {String? popUntilName}) {
    if (popUntilName?.trim().isNotEmpty ?? false) {
      return Navigator.pushNamedAndRemoveUntil(
        context,
        destination,
        ModalRoute.withName(destination),
        arguments: args,
      );
    } else {
      return Navigator.pushNamed(context, destination, arguments: args);
    }
  }
}
