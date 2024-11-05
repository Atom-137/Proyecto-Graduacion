
import 'package:app_notas_v2/pantallas/ciclo_escolar_screen.dart';
import 'package:app_notas_v2/pantallas/registro_grados_screen.dart';
import 'package:app_notas_v2/pantallas/reset_password_screen.dart';
import 'package:app_notas_v2/pantallas/screens.dart';
import 'package:app_notas_v2/pantallas/ver_estudiantes_screen.dart';
import 'package:app_notas_v2/pantallas/ver_maestros_screen.dart';
import 'package:app_notas_v2/pantallas/ver_notas_bimestrales_screen.dart';
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
              name    : 'verNotas',
              builder : (context, state) => const VerNotasBimestralesScreen(),
            ),
            GoRoute(
              path    : 'verMaestros',
              name    : 'verMaestros',
              builder : (context, state) => const VerMaestrosScreen(),
            ),
            GoRoute(
              path    : 'verEstudiantes',
              name    : 'verEstudiantes',
              builder : (context, state) => const VerEstudiantesScreen(),
            ),
            GoRoute(
              path    : 'cicloEscolar',
              name    : 'cicloEscolar',
              builder : (context, state) => const CicloEscolarScreen(),
            )
          ]
        ),
        GoRoute(
          path    : '/login' ,
          name    : 'login',
          builder : (context, state) => const IniciarSesionScreen(),
          routes  : [
            GoRoute(
                path    : 'resetPassword',
                name    : 'resetPassword',
                builder : (context, state) => const ResetPasswordScreen()
            )
          ]
        )
      ]
  );

  static final List<Map<String,String>> lstRutas = [
    {'modulo': 'Registro Estudiante', 'idRol' : '1', 'path':'/regEstudiante' , 'descripcion':'Modulo para Registro de Estudiantes'},
    {'modulo': 'Registro Grado'     , 'idRol' : '1', 'path':'/regGrado'      , 'descripcion': 'Modulo para el Registro de Grados'},
    {'modulo': 'Registro Maestros'  , 'idRol' : '1', 'path':'/regMaestro'    , 'descripcion': 'Modulo para el Registro de Maestros'},
    {'modulo': 'Registro Materias'  , 'idRol' : '1', 'path':'/regMaterias'   , 'descripcion': 'Modulo para el Registro de Materias'},
    {'modulo': 'Registro Notas'     , 'idRol' : '2', 'path':'/regNotas'      , 'descripcion' : 'Modulo para el Registro de Notas'},
    {'modulo': 'Ver Calificaciones' , 'idRol' : '2', 'path':'/verNotas'      , 'descripcion': 'Modulo para visualizacion de Notas'},
    {'modulo': 'Ver Calificaciones' , 'idRol' : '3', 'path':'/verNotas'      , 'descripcion': 'Modulo para visualizacion de Notas'},
    {'modulo': 'Ver Estudiantes'    , 'idRol' : '1', 'path':'/verEstudiantes', 'descripcion': 'Modulo para visualizacion de Estudiantes'},
    {'modulo': 'Ver Maestros'       , 'idRol' : '1', 'path':'/verMaestros'   , 'descripcion': 'Modulo para visualizacion de Masetros'},
    {'modulo': 'Ciclos Escolares'   , 'idRol' : '1', 'path':'/cicloEscolar'  , 'descripcion': 'Modulo para Ciclos Escolares'},
    // {'modulo': 'Reset Password'     , 'path':'/resetPassword'  , 'descripcion': 'Modulo para Ciclos Escolares'},
  ];
}
