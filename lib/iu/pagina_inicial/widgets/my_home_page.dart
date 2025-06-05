import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../fatos_de_gato/view_models/lista_fatos_gato_viewmodel.dart';
import '../../fatos_de_gato/widgets/lista_fatos_gatos.dart';
import '../../usuarios_github/widgets/lista_usuarios_github.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.adb_outlined),
                text: 'Fatos de Gatos',
              ),
              Tab(
                icon: Icon(Icons.group),
                text: 'Usuários GitHub',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListaFatosDeGatos(
              viewModel: ListaDeFatosDeGatoViewModel(
                repositorio: context.read(),
              ),
            ),
            const ListaDeUsuariosGithub(),
          ],
        ),
      ),
    );
  }
}
