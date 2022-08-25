import 'package:adopt_pummel/datasources/pet_datasource.dart';
import 'package:adopt_pummel/models/pet.dart';
import 'package:uuid/uuid.dart';

/// An in-memory implementation of the [PetDataSource] interface.
class MemoryPetDataSource implements PetDataSource {
  /// Map of ID -> Todo
  final _cache = <String, Pet>{};

  @override
  Future<Pet> create(Pet pet) async {
    final id = const Uuid().v4();
    final createdPet = pet.copyWith(id: id);
    _cache[id] = createdPet;
    return createdPet;
  }

  @override
  Future<List<Pet>> readAll() async => _cache.values.toList();

  @override
  Future<Pet?> read(String id) async => _cache[id];

  @override
  Future<Pet> update(String id, Pet todo) async {
    return _cache.update(id, (value) => todo);
  }

  @override
  Future<void> delete(String id) async => _cache.remove(id);
}
