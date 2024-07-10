import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../ui/ui.dart';

class BtnLocation extends StatelessWidget {
  const BtnLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.my_location_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            final userLocation = locationBloc.state.lastUserLocation;
            if (userLocation == null) {
              final snack = CustomSnackbar(message: 'No hay ubicacion');
              ScaffoldMessenger.of(context).showSnackBar(snack);
              return;
            }

            mapBloc.moveCamera(userLocation);
          },
        ),
      ),
    );
  }
}
