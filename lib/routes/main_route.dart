
import 'package:app_notas_v2/pantallas/registro_grados_screen.dart';
import 'package:app_notas_v2/pantallas/screens.dart';
import 'package:go_router/go_router.dart';

class MainRoute{

  static final GoRouter rutas = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path    : '/'  ,
          name    : 'home',
          builder : (context, state) => const HomeScreen(),
          routes  : [
            GoRoute(
              path    : 'regEstudiante',
              name    : 'regEstudiante',
              builder : (context, state) => const RegistroEstudianteScreen(),
            ),
            GoRoute(
              path    : 'regGrado',
              name    : 'regGrados',
              builder : (context, state) => const RegistroGradosScreen(),
            ),
            GoRoute(
              path    : 'regMaestro',
              name    : 'regMaestro',
              builder : (context, state) => const RegistroMaestroScreen(),
            ),
            GoRoute(
              path    : 'regMaterias',
              name    : 'regMaterias',
              builder : (context, state) => const RegistroMateriasScreen(),
            ),
            GoRoute(
              path    : 'regNotas',
              name    : 'regNotas',
              builder : (context, state) => const RegistroNotasScreen(),
            ),
            GoRoute(
              path    : 'verNotas',
              name    : 'regNotas',
              builder : (context, state) => const RegistroNotasScreen(),
            ),
            GoRoute(
              path    : 'verMaestros',
              name    : 'regNotas',
              builder : (context, state) => const RegistroNotasScreen(),
            ),
            GoRoute(
              path    : 'verEstudiantes',
              name    : 'regNotas',
              builder : (context, state) => const RegistroNotasScreen(),
            ),

          ]
        ),
        GoRoute(
          path    : '/login' ,
          name    : 'login',
          builder : (context, state) => const IniciarSesionScreen()
        ),

      ]
  );

  static final List<Map<String,String>> lstRutas = [
    {'modulo': 'Registro Estudiante', 'path':'/regEstudiante'},
    {'modulo': 'Registro Grado'     , 'path':'/regGrado'},
    {'modulo': 'Registro Maestros'  , 'path':'/regMaestro'},
    {'modulo': 'Registro Materias'  , 'path':'/regMaterias'},
    {'modulo': 'Registro Notas'     , 'path':'/regNotas'},

  ];
}
