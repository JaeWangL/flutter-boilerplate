import 'package:flutter_boilerplate/data/repositories/index.dart';
import 'package:flutter_boilerplate/domain/models/index.dart';

abstract class GetDietSocietyUseCase {
  final DietRepository _repository;

  GetDietSocietyUseCase(this._repository);
}

class GetDietSocietyUseCaseImpl extends GetDietSocietyUseCase {
  GetDietSocietyUseCaseImpl(DietRepository repository) : super(repository);

  Stream<ApiResource<DietSocietyModel>> execute() =>
    _repository.getDietSociety$();
}
