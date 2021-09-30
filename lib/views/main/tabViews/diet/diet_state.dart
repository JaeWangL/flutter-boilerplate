part of 'diet_cubit.dart';

abstract class DietState extends WidgetState {
  const DietState();
}

class DietInitialState extends DietState {
  @override
  List<Object?> get props => [];
}

class DietLoadingState extends DietState {
  @override
  List<Object?> get props => [];
}

class DietSocietyFailedState extends DietState {
  final String error;

  const DietSocietyFailedState(this.error);

  @override
  List<Object?> get props => [error];
}

class DietSocietySucceedState extends DietState {
  final List<DietSocietyModel> data;

  const DietSocietySucceedState(this.data);

  @override
  List<Object?> get props => [data];
}