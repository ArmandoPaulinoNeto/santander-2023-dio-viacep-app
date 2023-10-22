import 'dart:convert';

import '../entities/zipecode_entity.dart';
import 'package:http/http.dart' as http;

class BackFourAppRepository {
  var endpoint = "https://parseapi.back4app.com/classes/zipecode";

  create(ZipecodeEntity zipecodeEntity) {
    var body = jsonEncode(zipecodeEntity.toJson());
    var uri = Uri.parse(endpoint);
    http.post(uri,
        headers: {"X-Parse-Application-Id": "8EW6VQHwmffP8jiCVnqqAK0tIXDGUfwvWSrivnSo", "X-Parse-REST-API-Key": "PYZoOWVOLzBdkFIAHuByab0lEUY4PQbXVLzPbl3l", "Content-Type": "application/json"},
        body: body);
  }

  fetchAll() {
    var uri = Uri.parse(endpoint);    
    return http.get(uri,
      headers: {"X-Parse-Application-Id": "8EW6VQHwmffP8jiCVnqqAK0tIXDGUfwvWSrivnSo", "X-Parse-REST-API-Key": "PYZoOWVOLzBdkFIAHuByab0lEUY4PQbXVLzPbl3l", "Content-Type": "application/json"}
    );
  }

  update(ZipecodeEntity zipecodeEntity) {
    var body = jsonEncode(zipecodeEntity.toJson());
    var uri = Uri.parse("$endpoint/${zipecodeEntity.id!}");
    http.put(uri, headers: {"X-Parse-Application-Id": "8EW6VQHwmffP8jiCVnqqAK0tIXDGUfwvWSrivnSo", "X-Parse-REST-API-Key": "PYZoOWVOLzBdkFIAHuByab0lEUY4PQbXVLzPbl3l", "Content-Type": "application/json"}, body: body);
  }

  delete(String id) {
    var uri = Uri.parse("$endpoint/$id");
    http.delete(uri, headers: {"X-Parse-Application-Id": "8EW6VQHwmffP8jiCVnqqAK0tIXDGUfwvWSrivnSo", "X-Parse-REST-API-Key": "PYZoOWVOLzBdkFIAHuByab0lEUY4PQbXVLzPbl3l", "Content-Type": "application/json"});
  }
}
