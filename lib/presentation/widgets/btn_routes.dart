import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/presentation/screens/screens.dart';

class BtnRoutes extends StatelessWidget {
  const BtnRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.map_sharp,
            color: Colors.grey,
          ),
          onPressed: () async {
            final selectedRoute = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RouteSelectionScreen()),
            );
            if (selectedRoute != null) {
              switch (selectedRoute) {
                //RUTA 1
                case 'Sendero La Patria Corozal Ascenso':
                  mapBloc.getRouteName('Sendero La Patria Corozal Ascenso');
                  mapBloc.clearPolylines();
                  searchBloc.getPlacesByGJson(
                      'assets/Sendero base Takuna - La_patria_Corozal Ascenso.geojson');
                  break;
                //RUTA 2
                case 'Sendero La Patria Corozal Descenso':
                  mapBloc.getRouteName('Sendero La Patria Corozal Descenso');
                  mapBloc.clearPolylines();
                  searchBloc.getPlacesByGJson(
                      'assets/Sendero La patria corozal - Takuna Base _Descenso.geojson');
                  break;
                //RUTA 3
                case 'Sendero cancha San Julian':
                  mapBloc.getRouteName('Sendero cancha San Julian');
                  mapBloc.clearPolylines();
                  searchBloc.getPlacesByGJson(
                      'assets/Sendero Cancha San_Julian - Takuna Base.geojson');
                  break;
                //RUTA 4
                case 'Sendero Cruz de Dozule':
                  mapBloc.getRouteName('Sendero Cruz de Dozule');
                  mapBloc.clearPolylines();
                  searchBloc.getPlacesByGJson(
                      'assets/Sendero Circuito Takuna base _Cruz de Dozule.geojson');
                  break;
                //RUTA 5
                case 'Sendero Farrallones El Jardin':
                  mapBloc.getRouteName('Sendero Farrallones El Jardin');
                  mapBloc.clearPolylines();
                  searchBloc.getPlacesByGJson(
                      'assets/Takuna_Sendero_Farrallones-El_jardin-Takuna-Base.geojson');
                  break;
                //RUTA 6
                case 'Sendero Mateguada':
                  mapBloc.getRouteName('Sendero Mateguada');
                  mapBloc.clearPolylines();
                  searchBloc.getPlacesByGJson(
                      'assets/Sendero Takuna Base _Mateguadua.geojson');
                  break;
              }
            }
          },
        ),
      ),
    );
  }
}
