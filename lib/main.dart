import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/presentation/screens/screens.dart';
import 'package:flutter/services.dart';

//Archivo main
void main() {
  //Declaracion de un multiblocprovider que contendrá los demas, declaracion
  //necesaria para que funcionen estos
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GpsBloc()),
    BlocProvider(create: (context) => LocationBloc()),
    BlocProvider(
        create: (context) =>
            MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
    BlocProvider(
        create: (context) =>
            SearchBloc(mapBloc: BlocProvider.of<MapBloc>(context)))
  ], child: const TakunaApp()));
}

class TakunaApp extends StatelessWidget {
  const TakunaApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Configuracion de la status bar y la navigation bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 153, 204, 51),
      systemNavigationBarColor: Colors.transparent,
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Takuna Application',
      home: LoadingRoutesScreen(), //Llamado de la primera pantalla del programa
    );
  }
}
