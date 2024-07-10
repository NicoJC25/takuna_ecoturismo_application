import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/config/themes/themes.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  const MapView(
      {super.key,
      required this.initialLocation,
      required this.polylines,
      required this.markers});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          polylines: polylines,
          markers: markers,
          style: jsonEncode(takunaMapTheme),
          onMapCreated: (controller) =>
              mapBloc.add(OnMapInitializedEvent(controller)),
        ),
      ),
    );
  }
}
