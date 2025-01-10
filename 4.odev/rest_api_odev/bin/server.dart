import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final router = Router();

  router.get('/api/add-two', (Request request) {
    final num1 = num.tryParse(request.url.queryParameters['num1'] ?? '');
    final num2 = num.tryParse(request.url.queryParameters['num2'] ?? '');

    if (num1 == null || num2 == null) {
      return Response.badRequest(
        body: json.encode({'error': 'Geçerli sayılar girin.'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final result = num1 + num2;

    return Response.ok(
      json.encode({'result': result}),
      headers: {'Content-Type': 'application/json'},
    );
  });

  router.post('/api/multiply', (Request request) async {
    final payload = await request.readAsString();
    final data = json.decode(payload);

    final numbers = List<num>.from(data['numbers']);

    if (numbers.isEmpty) {
      return Response.badRequest(
        body: json.encode({'error': 'No numbers provided'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    num result = numbers[0];
    for (var i = 1; i < numbers.length; i++) {
      result *= numbers[i];
    }

    return Response.ok(
      json.encode({'result': result}),
      headers: {'Content-Type': 'application/json'},
    );
  });

  var server = await io.serve(router, InternetAddress.anyIPv4, 13);
  print('Server running on http://localhost:${server.port}');
}
