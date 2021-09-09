import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/services/navigation/type.dart';

abstract class WidgetState extends Equatable {
  const WidgetState();
}

abstract class NavigationState extends WidgetState {
  final String destination;
  final dynamic args;
  final String? popUntil;
  final NavigationType? navigationType;

  const NavigationState(
    this.destination,
    this.args, {
    this.popUntil,
    this.navigationType,
  });
}
