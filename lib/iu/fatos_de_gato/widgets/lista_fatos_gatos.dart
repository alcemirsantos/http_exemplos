import 'package:flutter/material.dart';

import '../../../core/resultado.dart';
import '../../../dados/modelos/fatos_gato_model.dart';
import '../view_models/lista_fatos_gato_viewmodel.dart';

class ListaFatosDeGatos extends StatelessWidget {
  final ListaDeFatosDeGatoViewModel viewModel;

  const ListaFatosDeGatos({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.fatosDeGato,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Ok r = snapshot.data as Ok<List<FatosDeGatoModel>>;
          var facts = r.value;

          return ListView.builder(
            itemCount: facts.length,
            itemBuilder: (_, index) {
              FatosDeGatoModel fato = facts[index];
              return ListTile(
                leading: const Icon(Icons.adb),
                title: Text(fato.fact ?? 'Sem fato algum'),
                subtitle: Text('${fato.length ?? 0}'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('ocorreu um erro: ${snapshot.error.toString()}'),
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
