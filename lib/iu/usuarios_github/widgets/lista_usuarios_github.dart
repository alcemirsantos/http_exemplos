import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/resultado.dart';
import '../../../dados/modelos/usuario_github_model.dart';
import '../../../dados/repositorios/repositorio_usuarios_github.dart';

class ListaDeUsuariosGithub extends StatelessWidget {
  const ListaDeUsuariosGithub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositorioDeUsuariosGithub r =
        Provider.of<RepositorioDeUsuariosGithub>(context);

    return FutureBuilder(
      future: r.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var users = (snapshot.data as Ok<List<GithubUserModel>>).value;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              GithubUserModel user = users[index];
              return ListTile(
                leading: const Icon(Icons.verified_user),
                title: Text(user.name ?? 'Anonimo'),
                subtitle: Text(user.blog ?? 'sem blog'),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
