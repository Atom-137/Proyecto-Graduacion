import 'dart:convert';

Estudiante estudianteFromJson(String str) => Estudiante.fromJson(json.decode(str));

String estudianteToJson(Estudiante data) => json.encode(data.toJson());

class Estudiante {
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String cui;
  String grado;
  String user;

  Estudiante({
    required this.primerNombre,
    required this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.cui,
    required this.grado,
    required this.user
  });

  factory Estudiante.fromJson(Map<String, dynamic> json) => Estudiante(
    primerNombre    : json["primerNombre"],
    segundoNombre   : json["segundoNombre"],
    primerApellido  : json["primerApellido"],
    segundoApellido : json["segundoApellido"],
    cui             : json["cui"],
    grado           : json["grado"],
    user            : json["user"]
  );

  Map<String, dynamic> toJson() => {
    "primerNombre"    : primerNombre,
    "segundoNombre"   : segundoNombre,
    "primerApellido"  : primerApellido,
    "segundoApellido" : segundoApellido,
    "cui"             : cui,
    "grado"           : grado,
    "user"            : user
  };
}
