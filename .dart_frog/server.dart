// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/pets/index.dart' as pets_index;
import '../routes/pets/[id].dart' as pets_$id;
import '../routes/owners/owners.dart' as owners_owners;

import '../routes/_middleware.dart' as middleware;

void main() => hotReload(createServer);

Future<HttpServer> createServer() {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, ip, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/owners', (r) => buildOwnersHandler()(r))
    ..mount('/pets', (r) => buildPetsHandler()(r))
    ..mount('/', (r) => buildHandler()(r));
  return pipeline.addHandler(router);
}

Handler buildOwnersHandler() {
  const pipeline = Pipeline();
  final router = Router()
    ..all('/owners', owners_owners.onRequest);
  return pipeline.addHandler(router);
}

Handler buildPetsHandler() {
  const pipeline = Pipeline();
  final router = Router()
    ..all('/', pets_index.onRequest)..all('/<id>', pets_$id.onRequest);
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  const pipeline = Pipeline();
  final router = Router()
    ..all('/', index.onRequest);
  return pipeline.addHandler(router);
}
