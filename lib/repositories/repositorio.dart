import 'package:dio/dio.dart';
import '../core/parametros.dart';

abstract class Repositorio<T> {
  Dio dio = Dio();

  Repositorio({required String baseUrl}) {
    dio.options.baseUrl = baseUrl;
  }

  /// recupera uma instância de [T] baseado nos parâmetros.
  Future<T> get(Parametros p);

  /// recupera todas as instâncias de [T].
  Future<List<T>> getAll();

  /// adiciona uma instância de [T].
  Future<T> adiciona(Parametros p);

  /// atualiza uma instância de [T].
  Future<T> atualiza(Parametros p);

  /// remove uma instância de [T].
  Future<bool> remove(Parametros p);
}
