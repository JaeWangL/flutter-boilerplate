import 'package:json_annotation/json_annotation.dart';

part 'diet_dtos.g.dart';

enum DietType {
  @JsonValue(0)
  English,

  @JsonValue(1)
  Event,

  @JsonValue(2)
  Ramen,

  @JsonValue(3)
  SnackBar,

  @JsonValue(4)
  Bowl,

  @JsonValue(5)
  StaffNoraml,

  @JsonValue(6)
  StaffPremium,
}

@JsonSerializable()
class DietSocietyDTO {
  final DietType type;
  final String value;

  DietSocietyDTO(
    this.type,
    this.value,
  );

  factory DietSocietyDTO.fromJson(Map<String, dynamic> json) =>
      _$DietSocietyDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DietSocietyDTOToJson(this);
}

@JsonSerializable()
class DietNavalDTO {
  final List<String> lunch;
  final List<String> dinner;

  DietNavalDTO(
    this.lunch,
    this.dinner,
  );

  factory DietNavalDTO.fromJson(Map<String, dynamic> json) =>
      _$DietNavalDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DietNavalDTOToJson(this);
}
