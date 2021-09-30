// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DietApi implements DietApi {
  _DietApi(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://pxfpulri8j.execute-api.ap-northeast-2.amazonaws.com/dev';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LambdaBaseDTO<List<DietSocietyDTO>>> getDietSocietyAsync() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LambdaBaseDTO<List<DietSocietyDTO>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/diet/society/today',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LambdaBaseDTO<List<DietSocietyDTO>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<DietSocietyDTO>(
                (i) => DietSocietyDTO.fromJson(i as Map<String, dynamic>))
            .toList());
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
