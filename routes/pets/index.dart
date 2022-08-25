import 'dart:async';
import 'dart:io';

import 'package:adopt_pummel/datasources/pet_datasource.dart';
import 'package:adopt_pummel/models/pet.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.delete:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final dataSource = context.read<PetDataSource>();
  final todos = await dataSource.readAll();
  return Response.json(body: todos);
}

Future<Response> _post(RequestContext context) async {
  final dataSource = context.read<PetDataSource>();
  final pet = Pet.fromJson(await context.request.json());

  return Response.json(
    statusCode: HttpStatus.created,
    body: await dataSource.create(pet),
  );
}
