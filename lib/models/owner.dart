import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner {
  const Owner({
    required this.id,
    required this.name,
  });
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  final String id;
  final String name;

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
