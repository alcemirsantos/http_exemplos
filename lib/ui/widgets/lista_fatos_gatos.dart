import 'package:flutter/material.dart';
import 'package:http_exemplos/models/lista_fatos_gatos_model.dart';
import 'package:http_exemplos/repositories/repositorio_fatos_gatos.dart';
import 'package:provider/provider.dart';

class ListaFatosDeGatos extends StatelessWidget {
  const ListaFatosDeGatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositorioDeFatosDeGatos r =
        Provider.of<RepositorioDeFatosDeGatos>(context);

    return FutureBuilder(
      future: r.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var users = snapshot.data as List<FatosDeGatoModel>;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              FatosDeGatoModel fato = users[index];
              return ListTile(
                leading: const Icon(Icons.adb),
                title: Text(fato.fact ?? 'Sem fato algum'),
                subtitle: Text('${fato.length ?? 0}'),
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
