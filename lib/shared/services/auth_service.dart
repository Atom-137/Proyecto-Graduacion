
import 'dart:convert';

import '../../models/models.dart';
import 'package:http/http.dart' as http;

class AuthServices{

  Future <RespuestaApi> login( Map<String,String> datosLogin ) async{

    const String _baseUrl = 'http://192.168.0.187:5000/apinotas';
    //  CONFIG PRODUCCION
    //  const String _baseUrl = 'http://3.133.134.198:8000/apinotas';

    final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers : {'Content-Type': 'application/json'},
        body    : jsonEncode(datosLogin)
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      RespuestaApi rs =  RespuestaApi.fromJson(jsonDecode(response.body));
      return rs;
    } else {
      throw Exception('Error al enviar datos: ${response.statusCode}');
    }
  }
}