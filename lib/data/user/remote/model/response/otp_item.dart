import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_item.g.dart';

@JsonSerializable()
class OtpItem extends Equatable {
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;

  OtpItem(this.success, this.code, this.message);

  @override
  List<Object> get props => [success, code, message];

  factory OtpItem.fromJson(Map<String, dynamic> json) =>
      _$OtpItemFromJson(json);

  Map<String, dynamic> toJson() => _$OtpItemToJson(this);
}
