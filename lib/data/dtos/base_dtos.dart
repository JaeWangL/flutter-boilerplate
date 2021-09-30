import 'package:json_annotation/json_annotation.dart';

part 'base_dtos.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LambdaBaseDTO<T> {
  T data;
  String path;

  LambdaBaseDTO(this.data, this.path);

  factory LambdaBaseDTO.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$LambdaBaseDTOFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$LambdaBaseDTOToJson(this, toJsonT);
}
