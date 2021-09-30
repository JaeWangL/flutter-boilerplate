import 'package:flutter_boilerplate/data/apis/index.dart';
import 'package:flutter_boilerplate/data/caching/index.dart';
import 'package:flutter_boilerplate/domain/models/index.dart';

abstract class DietRepository {
  final DietApi api;
  final DietCaching caching;

  DietRepository(this.api, this.caching);

  Stream<ApiResource<DietSocietyModel>> getDietSociety$();
}
