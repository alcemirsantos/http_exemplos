import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'dados/repositorios/repositorio_fatos_gatos.dart';
import 'dados/repositorios/repositorio_usuarios_github.dart';
import 'dados/servicos/sevicos.dart';
import 'iu/pagina_inicial/widgets/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // injeção de dependências
      providers: [
        Provider(create: (_) => ServicoDeFatosDeGatos()),
        Provider(create: (_) => ServicoDeUsuariosGithub()),
        Provider(create: (_) => RepositorioDeFatosDeGatos(context.read())),
        Provider(create: (_) => RepositorioDeUsuariosGithub(context.read())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
