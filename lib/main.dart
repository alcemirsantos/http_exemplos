import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'repositories/repositorio_fatos_gatos.dart';
import 'repositories/repositorio_usuarios_github.dart';
import 'ui/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => RepositorioDeFatosDeGatos()),
        Provider(create: (_) => RepositorioDeUsuariosGithub()),
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
