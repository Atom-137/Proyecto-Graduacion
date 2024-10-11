// To parse this JSON data, do
//
//     final curso = cursoFromJson(jsonString);

import 'dart:convert';

Curso cursoFromJson(String str) => Curso.fromJson(json.decode(str));

String cursoToJson(Curso data) => json.encode(data.toJson());

class Curso {
  String curso;
  String idGrado;
  String idMaestro;

  Curso({
    required this.curso,
    required this.idGrado,
    required this.idMaestro,
  });

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
    curso: json["curso"],
    idGrado: json["grado"],
    idMaestro: json["maestro"],
  );

  Map<String, dynamic> toJson() => {
    "curso": curso,
    "idGrado": idGrado,
    "idMaestro": idMaestro,
  };
}
