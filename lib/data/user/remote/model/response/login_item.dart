import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exchange_token_item.dart';

part 'login_item.g.dart';

@JsonSerializable()
class LoginItem extends Equatable {
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final ExchangeTokenItem exchangeToken;

  LoginItem(this.success, this.code, this.message, this.exchangeToken);

  @override
  List<Object> get props => [exchangeToken];

  factory LoginItem.fromJson(Map<String, dynamic> json) =>
      _$LoginItemFromJson(json);

  Map<String, dynamic> toJson() => _$LoginItemToJson(this);
}
