import 'package:dio/dio.dart';
import 'package:http_exemplos/core/parametros.dart';
import 'package:http_exemplos/models/lista_fatos_gatos_model.dart';

import 'repositorio.dart';

class RepositorioDeFatosDeGatos extends Repositorio<FatosDeGatoModel> {
  final String endpointFatoAleatorio = 'fact/';
  final String endpointListDeFatos = 'facts/';

  RepositorioDeFatosDeGatos() : super(baseUrl: 'https://catfact.ninja/');

  @override
  Future<FatosDeGatoModel> adiciona(Parametros p) {
    // TODO: implement adiciona
    throw UnimplementedError();
  }

  @override
  Future<FatosDeGatoModel> atualiza(Parametros p) {
    // TODO: implement atualiza
    throw UnimplementedError();
  }

  @override
  Future<FatosDeGatoModel> get(Parametros p) async {
    Response resposta;
    try {
      resposta = await dio.get(endpointFatoAleatorio);
      if (resposta.statusCode == 200) {
        return FatosDeGatoModel.fromJson(resposta.data);
      }
    } on DioError catch (e) {
      return FatosDeGatoModel(fact: e.message, length: e.message.length);
    }
    String fato = 'Fato avulso';
    return FatosDeGatoModel(fact: fato, length: fato.length);
  }

  @override
  Future<List<FatosDeGatoModel>> getAll() async {
    Response resposta;
    try {
      resposta = await dio.get(endpointListDeFatos);
      if (resposta.statusCode == 200) {
        return ListaDeFatosModel.fromJson(resposta.data).data!;
      }
    } on DioError catch (e) {
      return ListaDeFatosModel(
        data: [FatosDeGatoModel(fact: e.message, length: e.message.length)],
      ).data!;
    }
    String fato = 'Fato avulso';
    return ListaDeFatosModel(
      data: [FatosDeGatoModel(fact: fato, length: fato.length)],
    ).data!;
  }

  @override
  Future<bool> remove(Parametros p) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
