import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/presentation/screens/screens.dart';

//Pantalla de validacion permisos gps
class LoadingRoutesScreen extends StatelessWidget {
  const LoadingRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
        return state.isAllGranted
            ? const RoutesMapScreen()
            : const GpsAccesScreen();
      }),
    );
  }
}
