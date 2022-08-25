import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  // Access the incoming request.
  final request = context.request;

  // Return a response.
  // return Response(statusCode: 201, body: 'Hello World');
  return Response.json(
    body: <String, dynamic>{'hello': 'world!'},
  );
}
