import 'package:flutter_boilerplate/common/index.dart';
import 'package:flutter_boilerplate/domain/models/index.dart';
import 'package:flutter_boilerplate/domain/useCases/diet/index.dart';

part 'diet_state.dart';

class DietCubit extends WidgetCubit<DietState> {
  final GetDietSocietyUseCase _societyCase;

  DietCubit(
    this._societyCase,
  ) : super(DietInitialState());

  void getDietSociety() {
    _societyCase.execute().listen((ApiResource<List<DietSocietyModel>> event) {
      switch (event.status) {
        case Status.LOADING:
          emit(DietLoadingState());
          break;
        case Status.SUCCESS:
          emit(DietSocietySucceedState(event.data!));
          break;
        case Status.ERROR:
          emit(DietSocietyFailedState(event.message!));
      }
    }).onError((dynamic e) {
      emit(DietSocietyFailedState(e.toString()));
    });
  }
}
