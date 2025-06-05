import '../../../core/resultado.dart';
import '../../../dados/modelos/fatos_gato_model.dart';
import '../../../dados/repositorios/repositorio_fatos_gatos.dart';

class ListaDeFatosDeGatoViewModel {
  final RepositorioDeFatosDeGatos repositorio;

  ListaDeFatosDeGatoViewModel({required this.repositorio});

  Future<Resultado<List<FatosDeGatoModel>>> get fatosDeGato =>
      repositorio.getAll();
}
