import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.none,
)
class ApiResponse<T> {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final T data;

  ApiResponse(
      {required this.success,
        required this.code,
        required this.message,
        required this.data});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}