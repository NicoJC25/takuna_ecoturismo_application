import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/views/views.dart';

class RoutesMapScreen extends StatefulWidget {
  const RoutesMapScreen({super.key});

  @override
  State<RoutesMapScreen> createState() => _RoutesMapScreenState();
}

class _RoutesMapScreenState extends State<RoutesMapScreen> {
  late LocationBloc locationBloc;

  @override
  /*void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          if (locationState.startRouteLocation == null) {
            return const Center(child: Text('Espera por favor, Senderista...'));
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Set<Polyline> polylines = mapState.polylines;

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                        initialLocation: locationState.startRouteLocation!,
                        polylines: polylines),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
