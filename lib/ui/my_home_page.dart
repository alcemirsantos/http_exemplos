import 'package:flutter/material.dart';
import 'package:http_exemplos/models/usuario_github_model.dart';
import 'package:http_exemplos/repositories/repositorio.dart';
import 'package:http_exemplos/repositories/repositorio_usuarios_github.dart';
import 'package:http_exemplos/ui/widgets/lista_fatos_gatos.dart';
import 'package:provider/provider.dart';

import 'widgets/lista_usuarios_github.dart';

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
                icon: Icon(Icons.group),
                text: 'Usuários GitHub',
              ),
              Tab(
                icon: Icon(Icons.adb_outlined),
                text: 'Fatos de Gatos',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ListaDeUsuariosGithub(),
            ListaFatosDeGatos(),
          ],
        ),
      ),
    );
  }
}
