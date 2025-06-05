import 'package:dio/dio.dart';
import 'package:http_exemplos/core/resultado.dart';
import '../core/parametros.dart';

abstract class Repositorio<T> {
  Dio dio = Dio();

  Repositorio({required String baseUrl}) {
    dio.options.baseUrl = baseUrl;
  }

  /// recupera uma instância de [T] baseado nos parâmetros.
  Future<Resultado<T>> get(Parametros p);

  /// recupera todas as instâncias de [T].
  Future<Resultado<List<T>>> getAll();

  /// adiciona uma instância de [T].
  Future<Resultado<T>> adiciona(Parametros p);

  /// atualiza uma instância de [T].
  Future<Resultado<T>> atualiza(Parametros p);

  /// remove uma instância de [T].
  Future<Resultado<bool>> remove(Parametros p);
}
