import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

class QueryService{

  final String _baseUrl = 'http://192.168.0.187:5000/apinotas';

  Future <RespuestaApi> ejecutarQuery(String endpoint, Map<String,String> datos ) async{

     final response = await http.post(  Uri.parse('$_baseUrl/$endpoint'),
                                        headers: {'Content-Type': 'application/json'},
                                        body: jsonEncode(datos)
                                    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      RespuestaApi rs =  RespuestaApi.fromJson(jsonDecode(response.body));
      print(rs);
      return rs;
    } else {
      throw Exception('Error al enviar datos: ${response.statusCode}');
    }
  }



}