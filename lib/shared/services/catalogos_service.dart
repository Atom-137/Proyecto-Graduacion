
import 'package:app_notas_v2/models/models.dart';
import 'package:app_notas_v2/shared/services/query_service.dart';

class CatalogosService{

      Future <List<dynamic>> catalogoGrados() async {

        QueryService queryService = QueryService();
        RespuestaApi resp = await queryService.ejecutarQueryGet('catalogoGrados','');
        return resp.data.toList();
        
      }


}