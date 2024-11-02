import 'package:flutter/material.dart';

import '../shared/services/services.dart';

class VerEstudiantesScreen extends StatefulWidget {
  const VerEstudiantesScreen({super.key});

  @override
  State<VerEstudiantesScreen> createState() => _VerEstudiantesScreenState();
}

class _VerEstudiantesScreenState extends State<VerEstudiantesScreen> {

  late Future <List<dynamic>> _items;

  @override
  void initState() {
    super.initState();
    CatalogosService catalogos = CatalogosService();
    _items                     =  catalogos.catalogoEstudiante();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Estudiantes')
      ),
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
                      DataColumn(label: Text('Nombre Estudiante')),
                      DataColumn(label: Text('')),
                    ],
                    rows: items
                        .map(
                            (item) {

                          return DataRow(
                            cells: [
                              DataCell(Text(item['nomEstudiante'].toString())),
                              DataCell( IconButton(onPressed: (){

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
