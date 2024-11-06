import 'dart:convert';

import 'package:app_notas_v2/shared/services/catalogos_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class VerNotasBimestralesScreen extends StatefulWidget {
  const VerNotasBimestralesScreen({super.key});

  @override
  State<VerNotasBimestralesScreen> createState() => _VerNotasBimestralesScreenState();
}

class _VerNotasBimestralesScreenState extends State<VerNotasBimestralesScreen> {

  late Future <List<dynamic>> _items;

  @override
  void initState() {
    super.initState();
    CatalogosService catalogos = CatalogosService();
    _items                     =  catalogos.catalogoCalificaciones();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: const Text('Visualizacion de Notas')),
      body:  FutureBuilder<List<dynamic>>(
        future: _items,
        builder: (context, snapshot) {

          if (snapshot.data != null) {

            final items           = snapshot.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Estudiante')),
                    DataColumn(label: Text('Curso')),
                    DataColumn(label: Text('Calificacion')),
                    DataColumn(label: Text('Bimestre')),
                    DataColumn(label: Text('')),
                  ],
                  rows: items
                      .map(
                        (item) {

                          return DataRow(
                            cells: [
                              DataCell(Text(item['nombreEstudiante'])),
                              DataCell(Text(item['curso'].toString())),
                              DataCell(Text(item['calficacion'])),
                              DataCell(Text(item['bimestre'])),
                              DataCell( IconButton(onPressed: (){
                                context.go('/regNotas',extra: jsonEncode(item));
                              }, icon: const Icon( Icons.edit)))
                            ],
                          );
                        }
                  ).toList(),
                ),
              ),
            );
          }else{
            return const Text('Cargando informacion...');
          }
        },
      )
    );
  }
}




