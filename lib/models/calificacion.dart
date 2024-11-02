import 'dart:convert';

Calificacion calificacionFromJson(String str) => Calificacion.fromJson(json.decode(str));

String calificacionToJson(Calificacion data) => json.encode(data.toJson());

class Calificacion {
  String idCurso;
  String idDocente;
  String idEstudiante;
  String calificacion;
  String idBimestre;

  Calificacion({
    required this.idCurso,
    required this.idDocente,
    required this.idEstudiante,
    required this.calificacion,
    required this.idBimestre
  });

  factory Calificacion.fromJson(Map<String, dynamic> json) => Calificacion(
    idCurso       : json["curso"],
    idDocente     : '1',
    idEstudiante  : json["estudiante"],
    calificacion  : json["calificacion"],
    idBimestre    : json["bimestre"]
  );

  Map<String, dynamic> toJson() => {
    "idCurso"       : idCurso,
    "idDocente"     : idDocente,
    "idEstudiante"  : idEstudiante,
    "calificacion"  : calificacion,
    "idBimestre"    : idBimestre
  };
}
