import 'package:flutter_boilerplate/data/dtos/index.dart';
import 'package:flutter_boilerplate/domain/models/index.dart';

extension ToSocietyModel on DietSocietyDTO {
  DietSocietyModel toDomain() => DietSocietyModel(
        type,
        value,
      );
}

extension ToNavalModel on DietNavalDTO {
  DietNavalModel toDomain() => DietNavalModel(
        lunch,
        dinner,
      );
}
