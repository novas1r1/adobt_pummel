import 'dart:async';
import 'dart:io';

import 'package:adopt_pummel/datasources/pet_datasource.dart';
import 'package:adopt_pummel/models/pet.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final dataSource = context.read<PetDataSource>();
  final todo = await dataSource.read(id);

  if (todo == null) {
    return Response(statusCode: HttpStatus.notFound, body: 'Not found');
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, todo);
    case HttpMethod.put:
      return _put(context, id, todo);
    case HttpMethod.delete:
      return _delete(context, id);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, Pet pet) async {
  return Response.json(body: pet);
}

Future<Response> _put(RequestContext context, String id, Pet pet) async {
  final dataSource = context.read<PetDataSource>();
  final updatedTodo = Pet.fromJson(await context.request.json());
  final newTodo = await dataSource.update(
    id,
    pet.copyWith(
      name: updatedTodo.name,
      species: updatedTodo.species,
      weight: updatedTodo.weight,
      height: updatedTodo.height,
      age: updatedTodo.age,
      isFemale: updatedTodo.isFemale,
      owner: updatedTodo.owner,
    ),
  );

  return Response.json(body: newTodo);
}

Future<Response> _delete(RequestContext context, String id) async {
  final dataSource = context.read<PetDataSource>();
  await dataSource.delete(id);
  return Response(statusCode: HttpStatus.noContent);
}
