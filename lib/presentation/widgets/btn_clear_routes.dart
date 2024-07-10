import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../ui/ui.dart';

class BtnClearRoutes extends StatelessWidget {
  const BtnClearRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.remove_done_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            if (mapBloc.state.polylines.isNotEmpty) {
              mapBloc.clearPolylines();
            } else {
              final snack =
                  CustomSnackbar(message: 'No se ha seleccionado ninguna ruta');
              ScaffoldMessenger.of(context).showSnackBar(snack);
              return;
            }
          },
        ),
      ),
    );
  }
}
