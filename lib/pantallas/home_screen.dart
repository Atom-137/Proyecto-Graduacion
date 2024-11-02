import 'package:app_notas_v2/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Bienvenido'),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/img/logo_umg.png', // Cambia esto por tu imagen
                            width: 200,
                            height: 40,
                          ),
                        ),
                      ],),
      
      body: ListView.builder(
          itemCount: MainRoute.lstRutas.length,
          itemBuilder: (context, index) {
            final rutaAux = MainRoute.lstRutas[index];
            return Card(
              margin : const EdgeInsets.all(8.0),
              child  : ListTile(
                title    : Text(rutaAux['modulo']!),
                subtitle : const Text('Este es el subtitulo'),
                trailing : const Icon(Icons.arrow_forward),
                onTap    : () {
                         context.go( rutaAux['path']! );
                },
              ),
            );
          }
      )
    
    );
  }
}
