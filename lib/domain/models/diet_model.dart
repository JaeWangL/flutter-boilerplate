import 'package:flutter_boilerplate/data/dtos/index.dart';

class DietSocietyModel {
  final DietType type;
  final String value;

  DietSocietyModel(
    this.type,
    this.value,
  );

  DietSocietyModel copyWith({
    DietType? type,
    String? value,
  }) =>
      DietSocietyModel(
        type ?? this.type,
        value ?? this.value,
      );
}

class DietNavalModel {
  final List<String> lunch;
  final List<String> dinner;

  DietNavalModel(this.lunch, this.dinner);

  DietNavalModel copyWith({
    List<String>? lunch,
    List<String>? dinner,
  }) =>
      DietNavalModel(
        lunch ?? this.lunch,
        dinner ?? this.dinner,
      );
}
