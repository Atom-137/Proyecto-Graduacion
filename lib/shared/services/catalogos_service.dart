
import 'package:app_notas_v2/models/models.dart';
import 'package:app_notas_v2/shared/services/query_service.dart';

class CatalogosService{

      Future <List<dynamic>> catalogoGrados() async {

        QueryService queryService = QueryService();
        RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoGrados','');
        return resp.data.toList();
        
      }

      Future <List<dynamic>> catalogoSecciones() async {

        QueryService queryService = QueryService();
        RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoSecciones','');
        return resp.data.toList();

      }

      Future <List<dynamic>> catalogoMaestros() async {

        QueryService queryService = QueryService();
        RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoMaestros','');

        return resp.data.toList();
      }

       Future <List<dynamic>> catalogoCursos() async {

        QueryService queryService = QueryService();
        RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoCursos','');

        return resp.data.toList();
      }

      Future <List<dynamic>> catalogoEstudiante() async {

        QueryService queryService = QueryService();
        RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoEstudiantes','');

        return resp.data.toList();
      }

       Future <List<dynamic>> catalogoBimestres() async {

          QueryService queryService = QueryService();
          RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoBimestres','');

          return resp.data.toList();
      }
       Future <List<dynamic>> catalogoCalificaciones() async {

          QueryService queryService = QueryService();
          RespuestaApi resp         = await queryService.ejecutarQueryGet('catalogoCalificaciones','');

          return resp.data.toList();
      }



}