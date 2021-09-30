import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/configs/index.dart';
import 'package:flutter_boilerplate/data/dtos/index.dart';
import 'package:retrofit/retrofit.dart';

part 'diet_api.g.dart';

@RestApi(baseUrl: UrlConfig.baseAPIUrl)
abstract class DietApi {
  factory DietApi(Dio dio, {String? baseUrl}) = _DietApi;

  @GET('diet/society/today')
  Future<LambdaBaseDTO<DietSocietyDTO>> getDietSocietyAsync();
}
