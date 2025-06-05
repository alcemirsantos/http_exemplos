import 'package:dio/dio.dart';

abstract class Servico {
  late Dio dio;

  Servico(String baseUrl) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
}

class ServicoDeUsuariosGithub extends Servico {
  ServicoDeUsuariosGithub() : super('https://api.github.com/');

  final String endpoint = 'users/';

  recuperaUsuarioDoGithub(String param) => dio.get(endpoint + param);
}

class ServicoDeFatosDeGatos extends Servico {
  ServicoDeFatosDeGatos() : super('https://catfact.ninja/');
  final String endpointFatoAleatorio = 'fact/';
  final String endpointListDeFatos = 'facts/';

  Future<Response> recuperaFatoDeGatoAleatorio() =>
      dio.get(endpointFatoAleatorio);

  Future<Response> recuperaListaDeFatosDeGato() => dio.get(endpointListDeFatos);
}
