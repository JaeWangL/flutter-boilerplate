import 'package:flutter_boilerplate/data/caching/diet/diet_caching.dart';
import 'package:flutter_boilerplate/data/dtos/index.dart';

class DietCachingImpl extends DietCaching {
  DietSocietyDTO? dataSociety;
  DietNavalDTO? dataNaval;

  @override
  Future<DietSocietyDTO>? getDietSocietyAsync() =>
      Future.value(dataSociety);

  @override
  Future<DietNavalDTO>? getDietNavalAsync() =>
      Future.value(dataNaval);

  @override
  void putDietSociety(DietSocietyDTO data) {
    dataSociety = data;
  }

  @override
  void putDietNaval(DietNavalDTO data) {
    dataNaval = data;
  }
}
