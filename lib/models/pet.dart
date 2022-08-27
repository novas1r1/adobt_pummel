// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  const Pet({
    this.id,
    required this.name,
    required this.species,
    required this.weight,
    required this.height,
    required this.age,
    this.isFemale = true,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  /// uuid, auto generated on create
  final String? id;

  /// name
  final String name;

  /// species, can be dog, cat, fish, bird
  final Species species;

  /// weight in kg
  final double weight;

  /// height in cm
  final double height;

  /// age in years
  final int age;

  /// gender
  final bool isFemale;

  Map<String, dynamic> toJson() => _$PetToJson(this);

  Pet copyWith({
    String? id,
    String? name,
    Species? species,
    double? weight,
    double? height,
    int? age,
    bool? isFemale,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      isFemale: isFemale ?? this.isFemale,
    );
  }
}

enum Species {
  dog,
  cat,
  bird,
  fish,
}
