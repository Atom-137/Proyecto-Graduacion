import 'package:app_notas_v2/pantallas/registro_estudiante_screen.dart';
import 'package:app_notas_v2/pantallas/registro_maestro_screen.dart';
import 'package:app_notas_v2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => FormdynamicProvider(),
      child: MaterialApp(
        title: 'App Notas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RegistroMaestroScreen(),
      ),
    );
  }
}
