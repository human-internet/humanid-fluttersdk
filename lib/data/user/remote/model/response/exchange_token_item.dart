import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_token_item.g.dart';

@JsonSerializable()
class ExchangeTokenItem extends Equatable {
  @JsonKey(name: 'exchangeToken')
  final String token;

  ExchangeTokenItem(this.token);

  @override
  List<Object> get props => [token];

  factory ExchangeTokenItem.fromJson(Map<String, dynamic> json) =>
      _$ExchangeTokenItemFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeTokenItemToJson(this);
}