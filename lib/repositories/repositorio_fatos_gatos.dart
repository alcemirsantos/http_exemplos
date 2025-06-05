import 'package:dio/dio.dart';
import 'package:http_exemplos/core/parametros.dart';
import 'package:http_exemplos/core/resultado.dart';
import 'package:http_exemplos/models/lista_fatos_gatos_model.dart';

import 'repositorio.dart';

class RepositorioDeFatosDeGatos extends Repositorio<FatosDeGatoModel> {
  final String endpointFatoAleatorio = 'fact/';
  final String endpointListDeFatos = 'facts/';

  RepositorioDeFatosDeGatos() : super(baseUrl: 'https://catfact.ninja/');

  @override
  Future<Resultado<FatosDeGatoModel>> get(Parametros p) async {
    Response resposta;
    try {
      resposta = await dio.get(endpointFatoAleatorio);
      if (resposta.statusCode == 200) {
        return Resultado.ok(FatosDeGatoModel.fromJson(resposta.data));
      }
      // throw Exception("a requisição falhou");
    } on DioException catch (e) {
      return Resultado.error(
        Exception(
          FatosDeGatoModel(fact: e.message, length: e.message?.length),
        ),
      );
    }
    String fato = 'Fato avulso';
    return Resultado.error(
      Exception(
        FatosDeGatoModel(fact: fato, length: fato.length),
      ),
    );
  }

  @override
  Future<Resultado<List<FatosDeGatoModel>>> getAll() async {
    Response resposta;
    try {
      resposta = await dio.get(endpointListDeFatos);
      if (resposta.statusCode == 200) {
        return Resultado.ok(ListaDeFatosModel.fromJson(resposta.data).data!);
      }
    } on DioException catch (e) {
      return Resultado.error(
        Exception(
          ListaDeFatosModel(
            data: [
              FatosDeGatoModel(fact: e.message, length: e.message?.length)
            ],
          ).data!,
        ),
      );
    }
    String fato = 'Fato avulso';
    return Resultado.error(
      Exception(
        [FatosDeGatoModel(fact: fato, length: fato.length)],
      ),
    );
  }

  @override
  Future<Resultado<FatosDeGatoModel>> adiciona(Parametros p) {
    // TODO: implement adiciona
    throw UnimplementedError();
  }

  @override
  Future<Resultado<FatosDeGatoModel>> atualiza(Parametros p) {
    // TODO: implement atualiza
    throw UnimplementedError();
  }

  @override
  Future<Resultado<bool>> remove(Parametros p) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
