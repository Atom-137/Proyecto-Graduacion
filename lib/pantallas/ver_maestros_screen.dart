import 'package:flutter/material.dart';

import '../shared/services/services.dart';

class VerMaestrosScreen extends StatefulWidget {
  const VerMaestrosScreen({super.key});

  @override
  State<VerMaestrosScreen> createState() => _VerMaestrosScreenState();
}

class _VerMaestrosScreenState extends State<VerMaestrosScreen> {

  late Future <List<dynamic>> _items;

  @override
  void initState() {
    super.initState();
    CatalogosService catalogos = CatalogosService();
    _items                     =  catalogos.catalogoMaestros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Visualizacion de Maestros')),
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
                      DataColumn(label: Text('Nombre Maestro')),
                      DataColumn(label: Text('')),
                    ],
                    rows: items
                        .map(
                            (item) {

                          return DataRow(
                            cells: [
                              DataCell(Text(item['nombreMaestro'].toString())),
                              DataCell( IconButton(onPressed: (){}, icon: const Icon( Icons.edit)))
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


