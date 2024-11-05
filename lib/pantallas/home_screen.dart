import 'package:app_notas_v2/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<Map<String,String?>> getDatosUser() async {
    const FlutterSecureStorage secureStorage  =  FlutterSecureStorage();

    Map<String, String?> dataUser = {
      'idRol'       : await secureStorage.read(key: 'idRol'),
      'nombreUser'  : await secureStorage.read(key: 'nombreUser')
    };

    return dataUser;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getDatosUser(),
      builder: (context,snapshot) {

        if(snapshot.hasData){

          String nombreUser = snapshot.data!['nombreUser']!;
          String idRol      = snapshot.data!['nombreUser']!;

          return Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              appBar: AppBar(
                backgroundColor: const Color(0xFFFFFFFF),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre el título y la imagen
                  children: [
                    const Text('Bienvenido(a)'), // Aquí está tu título
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/img/logo_umg.png', // Cambia esto por tu imagen
                            width: 200,
                            height: 40,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              body: Container(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Ha iniciado sesion como : '),
                          Text(nombreUser),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 600.0,
                            child: ListView.builder(
                                itemCount: MainRoute.lstRutas.length,
                                itemBuilder: (context, index) {
                                  final rutaAux = MainRoute.lstRutas[index];
                                  return Card(
                                    color: Colors.blue,
                                    margin : const EdgeInsets.all(8.0),
                                    child  : ListTile(
                                      title    : Text(rutaAux['modulo']!),
                                      subtitle : Text(rutaAux['descripcion']!),
                                      trailing : const Icon(Icons.arrow_forward),
                                      onTap    : () {
                                        context.go( rutaAux['path']! );
                                      },
                                    ),
                                  );
                                }
                            ),
                          ),


                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.grey,
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              'Copyright © Jafir Garcia - 2024',
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset('assets/img/logo_umg.png', height: 20,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        }else{
          return const Text('Cargando Info...');
        }

    
      }
    );
  }
}
