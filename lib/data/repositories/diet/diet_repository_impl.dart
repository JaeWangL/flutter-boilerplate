import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/apis/index.dart';
import 'package:flutter_boilerplate/data/caching/index.dart';
import 'package:flutter_boilerplate/data/repositories/diet/diet_repository.dart';
import 'package:flutter_boilerplate/domain/extensions/index.dart';
import 'package:flutter_boilerplate/domain/models/index.dart';

class DietRepositoryImpl extends DietRepository {
  DietRepositoryImpl(DietApi api, DietCaching caching) : super(api, caching);

  @override
  Stream<ApiResource<List<DietSocietyModel>>> getDietSociety$() async* {
    yield ApiResource(Status.LOADING, null, null);

    try {
      final data = await api.getDietSocietyAsync();
      yield ApiResource(Status.SUCCESS, data.data.map((res) => res.toDomain()).toList(), null);
    } catch (error) {
      yield ApiResource(Status.ERROR, null, (error as DioError).message);
    }
  }
}
