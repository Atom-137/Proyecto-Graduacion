
import 'package:app_notas_v2/pantallas/registro_grados_screen.dart';
import 'package:app_notas_v2/pantallas/screens.dart';
import 'package:go_router/go_router.dart';

class MainRoute{

  static final GoRouter rutas = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path    : '/home'  ,
          name    : 'home',
          builder : (context, state) => HomeScreen()
        ),
        GoRoute(
          path    : '/login' ,
          name    : 'login',
          builder : (context, state) => IniciarSesionScreen()
        ),
        GoRoute(
          path    : '/regEstudiante',
          name    : 'regEstudiante',
          builder : (context, state) => RegistroEstudianteScreen(),
        ),
         GoRoute(
          path    : '/regGrado',
          name    : 'regGrado',
          builder : (context, state) => RegistroGradosScreen(),
        ),
         GoRoute(
          path    : '/regMaestro',
          name    : 'regMaestro',
          builder : (context, state) => RegistroMaestroScreen(),
        ),
         GoRoute(
          path    : '/regMaterias',
          name    : 'regMaterias',
          builder : (context, state) => RegistroMateriasScreen(),
        ),
         GoRoute(
          path    : '/regNotas',
          name    : 'regNotas',
          builder : (context, state) => RegistroNotasScreen(),
        )
      ]
  
  );
}
