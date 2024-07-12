import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

//Boton para seguir al usuario consecutivamente
class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
                icon: Icon(
                    //Cambio de widget si se esta siguiendo al usuario
                    state.isFollowingUser
                        ? Icons.directions_run_rounded
                        : Icons.hail_rounded,
                    color: Colors.grey),
                onPressed: () {
                  mapBloc.add(OnStartFollowingUserEvent());
                });
          },
        ),
      ),
    );
  }
}
