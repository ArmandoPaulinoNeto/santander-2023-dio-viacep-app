import 'dart:convert';
import 'package:consult_zipecode_app/entities/zipecode_entity.dart';
import 'package:http/http.dart' as http;

class ZipecodeRepository {
  var baseUrl = "https://viacep.com.br/ws/";
  
  
  getByZipecode(String address) async {

    var response = await http.get(Uri.parse(baseUrl + address));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ZipecodeEntity.fromJson(json);
    }
    return ["Return void"];
  }
}
