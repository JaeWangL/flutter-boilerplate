import 'package:flutter_boilerplate/data/dtos/index.dart';

abstract class DietCaching {
  Future<DietSocietyDTO>? getDietSocietyAsync();

  Future<DietNavalDTO>? getDietNavalAsync();

  void putDietSociety(DietSocietyDTO data);

  void putDietNaval(DietNavalDTO data);
}
