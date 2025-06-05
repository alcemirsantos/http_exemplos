import 'package:dio/dio.dart';
import 'package:http_exemplos/core/parametros.dart';
import 'package:http_exemplos/core/resultado.dart';
import 'package:http_exemplos/models/usuario_github_model.dart';

import 'repositorio.dart';

class RepositorioDeUsuariosGithub extends Repositorio<GithubUserModel> {
  final String endpoint = 'users/';
  final List<String> usernames = [
    'Alexandre16347',
    'AndreLuis6',
    'brunnuscz',
    'CarlosEddie',
    'Diogoloiola',
    'FranciscoRibeiroSilva',
    'Jeremias-2000',
    'jvitor425',
    'Vitor-Silva27',
    'josevictorpy',
    'kleidimilson',
    'Felipe-dot',
    'Manoel-Moura',
    'Marcelalopes',
    'MarcosRamonPR',
    'NailsonPereira2021',
    'segundopassos',
    'Brennez',
    'TiagoAbilio',
  ];

  RepositorioDeUsuariosGithub()
      : super(
          baseUrl: 'https://api.github.com/',
        );

  @override
  Future<Resultado<GithubUserModel>> get(Parametros p) async {
    Response resposta;
    try {
      resposta = await dio.get(endpoint + p.dados['username']);
      if (resposta.statusCode == 200) {
        return Resultado.ok(GithubUserModel.fromJson(resposta.data));
      }
    } on DioError catch (e) {
      return Resultado.error(
        Exception(
          GithubUserModel(
            name: e.message,
          ),
        ),
      );
    }

    return Resultado.error(
      Exception(
        GithubUserModel(
          name: 'Fulano de Tal',
          blog: 'www.vaiquecola.com.br',
        ),
      ),
    );
  }

  @override
  Future<Resultado<List<GithubUserModel>>> getAll() async {
    List<GithubUserModel> users = [];
    for (String username in usernames) {
      Resultado r = await get(Parametros(dados: {'username': username}));
      switch (r) {
        case Ok():
          users.add(r.value);
          break;
        default:
      }
    }
    return Resultado.ok(users);
  }

  @override
  Future<Resultado<GithubUserModel>> adiciona(Parametros p) {
    // TODO: implement adiciona
    throw UnimplementedError();
  }

  @override
  Future<Resultado<GithubUserModel>> atualiza(Parametros p) {
    // TODO: implement atualiza
    throw UnimplementedError();
  }

  @override
  Future<Resultado<bool>> remove(Parametros p) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
