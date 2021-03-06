import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable()
class OtpRequest {
  @JsonKey(name: 'countryCode')
  String countryCode;

  @JsonKey(name: 'phone')
  String phone;

  String clientId;
  String clientSecret;

  OtpRequest({this.countryCode, this.phone, this.clientId, this.clientSecret});

  factory OtpRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);
}
