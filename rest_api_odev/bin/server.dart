import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final router = Router();

  var server = await io.serve(router, InternetAddress.anyIPv4, 13);
  print('Server running on http://localhost:${server.port}');
}
