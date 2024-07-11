import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/presentation/widgets/btn_big_screen.dart';
import 'package:takuna_ecoturismo_application/presentation/widgets/widgets.dart';
import 'package:takuna_ecoturismo_application/views/views.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:google_fonts/google_fonts.dart';

class RoutesMapScreen extends StatefulWidget {
  const RoutesMapScreen({super.key});

  @override
  State<RoutesMapScreen> createState() => _RoutesMapScreenState();
}

class _RoutesMapScreenState extends State<RoutesMapScreen> {
  late MapBloc mapBloc;
  late LocationBloc locationBloc;
  final PanelController _panelController = PanelController();
  bool _isPanelOpen = false;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SlidingUpPanel(
        color: Colors.white70,
        minHeight: 70,
        controller: _panelController,
        onPanelSlide: (position) {
          setState(() {
            _isPanelOpen = position > 0.3;
          });
        },
        collapsed: Icon(
          Icons.drag_handle,
          color: Colors.grey[600],
          size: 45,
        ),
        panel: _buildPanel(),
        body: Scaffold(
          body: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, locationState) {
              if (locationState.lastUserLocation == null) {
                return const Center(
                    child: Text('Espera por favor, Senderista...'));
              }

              return BlocBuilder<MapBloc, MapState>(
                builder: (context, mapState) {
                  Set<Polyline> polylines = mapState.polylines;
                  Set<Marker> markers = mapState.markers;

                  return SingleChildScrollView(
                    child: Stack(
                      children: [
                        MapView(
                          initialLocation: locationState.lastUserLocation!,
                          polylines: polylines,
                          markers: markers,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BtnBigScreen(),
              BtnRoutes(),
              BtnClearRoutes(),
              BtnFollowUser(),
              BtnLocation(),
            ],
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    );
  }

  //CONFIGURACION DEL CONTENIDO DEL SLIDE UP

  Widget _buildPanel() {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, mapState) {
        mapBloc = BlocProvider.of<MapBloc>(context);
        if (mapState.polylines.isNotEmpty) {
          //RUTA 1
          if (mapBloc.state.selectedRoute ==
              'Sendero La Patria Corozal Ascenso') {
            return _ColumnSlideUpContentWidget(
              isPanelOpen: _isPanelOpen,
              title: """Ruta 1: Sendero La Patria Corozal Ascenso""",
              description: 'Descripcion de la ruta',
            );
          }
          //RUTA 2
          else if (mapBloc.state.selectedRoute ==
              'Sendero La Patria Corozal Descenso') {
            return _ColumnSlideUpContentWidget(
              isPanelOpen: _isPanelOpen,
              title: """Ruta 2: Sendero La Patria Corozal Descenso""",
              description: 'Descripcion de la ruta',
            );
          }
          //RUTA 3
          else if (mapBloc.state.selectedRoute == 'Sendero cancha San Julian') {
            return _ColumnSlideUpContentWidget(
              isPanelOpen: _isPanelOpen,
              title: """Ruta 3: Sendero Cancha San Julian""",
              description: 'Descripcion de la ruta',
            );
          }
          //RUTA 4
          else if (mapBloc.state.selectedRoute == 'Sendero Cruz de Dozule') {
            return _ColumnSlideUpContentWidget(
              isPanelOpen: _isPanelOpen,
              title: """Ruta 4: Sendero Cruz de Dozule""",
              description: 'Descripcion de la ruta',
            );
          }
          //RUTA 5
          else if (mapBloc.state.selectedRoute ==
              'Sendero Farrallones El Jardin') {
            return _ColumnSlideUpContentWidget(
              isPanelOpen: _isPanelOpen,
              title: """Ruta 5: Sendero Farrallones El Jardin""",
              description: 'Descripcion de la ruta',
            );
          }
          //RUTA 6
          else if (mapBloc.state.selectedRoute == 'Sendero Mateguada') {
            return _ColumnSlideUpContentWidget(
              isPanelOpen: _isPanelOpen,
              title: """Ruta 6: Sendero Mateguada""",
              description: 'Descripcion de la ruta',
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: const Text(
                    'Elige una ruta para ver su descripción',
                    style:
                        TextStyle(fontSize: 24.0, fontFamily: 'RadioATreqer'),
                  ),
                ),
              ],
            ),
          );
        }
        return _buildPanel();
      },
    );
  }
}

//CONFIGURACION VISUAL PARA EL INTERIOR DEL SLIDE UP

class _ColumnSlideUpContentWidget extends StatelessWidget {
  final String title;
  final String description;

  const _ColumnSlideUpContentWidget({
    required bool isPanelOpen,
    required this.title,
    required this.description,
  }) : _isPanelOpen = isPanelOpen;

  final bool _isPanelOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: _isPanelOpen,
          child: Container(
            margin: const EdgeInsets.only(left: 40, top: 80, right: 40),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontFamily: 'RadioATreqer'),
            ),
          ),
        ),
        Visibility(
          visible: _isPanelOpen,
          child: Container(
            margin: const EdgeInsets.only(left: 40, top: 30, right: 40),
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.redHatDisplay().fontFamily),
            ),
          ),
        )
      ],
    );
  }
}
