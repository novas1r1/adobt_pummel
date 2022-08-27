// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as String?,
      name: json['name'] as String,
      species: $enumDecode(_$SpeciesEnumMap, json['species']),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      age: json['age'] as int,
      isFemale: json['isFemale'] as bool? ?? true,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': _$SpeciesEnumMap[instance.species]!,
      'weight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'isFemale': instance.isFemale,
    };

const _$SpeciesEnumMap = {
  Species.dog: 'dog',
  Species.cat: 'cat',
  Species.bird: 'bird',
  Species.fish: 'fish',
};
