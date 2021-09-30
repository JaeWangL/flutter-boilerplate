// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LambdaBaseDTO<T> _$LambdaBaseDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    LambdaBaseDTO<T>(
      fromJsonT(json['data']),
      json['path'] as String,
    );

Map<String, dynamic> _$LambdaBaseDTOToJson<T>(
  LambdaBaseDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'path': instance.path,
    };
