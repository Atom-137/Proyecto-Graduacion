import 'dart:convert';

import '../../models/models.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String _baseUrl = 'http://192.168.0.187:5000/apinotas';

  //  CONFIG PRODUCCION
  //  const String _baseUrl = 'http://3.133.134.198:8000/apinotas';

  Future<RespuestaApi> login(Map<String, String> datosLogin) async {
    final response = await http.post(Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(datosLogin));

    if (response.statusCode == 201 || response.statusCode == 200) {
      RespuestaApi rs = RespuestaApi.fromJson(jsonDecode(response.body));
      return rs;
    } else {
      throw Exception('Error al enviar datos: ${response.statusCode}');
    }
  }

  Future<RespuestaApi> setPass(Map<String, String> datosLogin) async {
    final response = await http.post(Uri.parse('$_baseUrl/setPass'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(datosLogin));

    if (response.statusCode == 201 || response.statusCode == 200) {
      RespuestaApi rs = RespuestaApi.fromJson(jsonDecode(response.body));
      return rs;
    } else {
      throw Exception('Error al enviar datos: ${response.statusCode}');
    }
  }

  Future<RespuestaApi> resetPass(Map<String, String> datosLogin) async {
    final response = await http.post(Uri.parse('$_baseUrl/resetPass'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(datosLogin));

    if (response.statusCode == 201 || response.statusCode == 200) {
      RespuestaApi rs = RespuestaApi.fromJson(jsonDecode(response.body));
      return rs;
    } else {
      throw Exception('Error al enviar datos: ${response.statusCode}');
    }
  }
}
