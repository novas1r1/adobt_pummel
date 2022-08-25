import 'package:adopt_pummel/models/pet.dart';

/// An interface for a pets data source.
/// A pets data source supports basic C.R.U.D operations.
/// * C - Create
/// * R - Read
/// * U - Update
/// * D - Delete
abstract class PetDataSource {
  /// Create and return the newly created pet.
  Future<Pet> create(Pet pet);

  /// Return all pets.
  Future<List<Pet>> readAll();

  /// Return a pet with the provided [id] if one exists.
  Future<Pet?> read(String id);

  /// Update the pet with the provided [id] to match [pet] and
  /// return the updated pet.
  Future<Pet> update(String id, Pet pet);

  /// Delete the pet with the provided [id] if one exists.
  Future<void> delete(String id);
}
