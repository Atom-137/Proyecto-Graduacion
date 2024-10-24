import 'dart:convert';

RespuestaApi respuestaApiFromJson(String str) => RespuestaApi.fromJson(json.decode(str));

String respuestaApiToJson(RespuestaApi data) => json.encode(data.toJson());

class RespuestaApi {
  String        respuesta;
  String        mensaje;
  dynamic       data;


  RespuestaApi({
    required this.respuesta,
    required this.mensaje,
    required this.data
  });

  factory RespuestaApi.fromJson(Map<String, dynamic> json) => RespuestaApi(
    respuesta : json["respuesta"],
    mensaje   : json["mensaje"],
    data      : json["data"] ?? []
  );

  Map<String, dynamic> toJson() => {
    "respuesta" : respuesta,
    "mensaje"   : mensaje,
    "data"      : data
  };
}
