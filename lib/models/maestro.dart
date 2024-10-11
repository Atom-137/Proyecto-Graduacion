import 'dart:convert';

Maestro maestroFromJson(String str) => Maestro.fromJson(json.decode(str));

String maestroToJson(Maestro data) => json.encode(data.toJson());

class Maestro {
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String cui;
  String correoElectronico;
  String user;

  Maestro({
    required this.primerNombre,
    required this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.cui,
    required this.correoElectronico,
    required this.user
  });

  factory Maestro.fromJson(Map<String, dynamic> json) => Maestro(
    primerNombre      : json["primerNombre"],
    segundoNombre     : json["segundoNombre"],
    primerApellido    : json["primerApellido"],
    segundoApellido   : json["segundoApellido"],
    cui               : json["cui"],
    correoElectronico : json["correoElectronico"],
    user              : json['user']
  );

  Map<String, dynamic> toJson() => {
    "primerNombre"      : primerNombre,
    "segundoNombre"     : segundoNombre,
    "primerApellido"    : primerApellido,
    "segundoApellido"   : segundoApellido,
    "cui"               : cui,
    "correoElectronico" : correoElectronico,
    "user"              : user
  };
}
