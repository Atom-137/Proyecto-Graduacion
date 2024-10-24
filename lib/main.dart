import 'package:app_notas_v2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pantallas/screens.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'App Notas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Center(child: IniciarSesionScreen()),
      ),
    );
  }
}
