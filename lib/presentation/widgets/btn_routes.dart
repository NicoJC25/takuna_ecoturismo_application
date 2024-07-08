import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

class BtnRoutes extends StatelessWidget {
  const BtnRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: ElevatedButton(
          onPressed: () {
            //Navigator.push(context,
            //MaterialPageRoute(builder: (context) => const RoutesScreen()));
            showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 100, 100),
                items: [
                  PopupMenuItem(
                    value: 1,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        Text('Sendero La Patria Corozal Ascenso'),
                      ],
                    ),
                    onTap: () {
                      mapBloc.clearPolylines();
                      searchBloc.getPlacesByGJson(
                          'assets/Sendero base Takuna - La_patria_Corozal Ascenso.geojson');
                    },
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        Text('Sendero La Patria Corozal Descenso'),
                      ],
                    ),
                    onTap: () {
                      mapBloc.clearPolylines();
                      searchBloc.getPlacesByGJson(
                          'assets/Sendero La patria corozal - Takuna Base _Descenso.geojson');
                    },
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        Text('Sendero cancha San Julian'),
                      ],
                    ),
                    onTap: () {
                      mapBloc.clearPolylines();
                      searchBloc.getPlacesByGJson(
                          'assets/Sendero Cancha San_Julian - Takuna Base.geojson');
                    },
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        Text('Sendero Cruz de Dozule'),
                      ],
                    ),
                    onTap: () {
                      mapBloc.clearPolylines();
                      searchBloc.getPlacesByGJson(
                          'assets/Sendero Circuito Takuna base _Cruz de Dozule.geojson');
                    },
                  ),
                  PopupMenuItem(
                    value: 5,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        Text('Sendero Farrallones El Jardin'),
                      ],
                    ),
                    onTap: () {
                      mapBloc.clearPolylines();
                      searchBloc.getPlacesByGJson(
                          'assets/Takuna_Sendero_Farrallones-El_jardin-Takuna-Base.geojson');
                    },
                  ),
                  PopupMenuItem(
                    value: 6,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        Text('Sendero Mateguada'),
                      ],
                    ),
                    onTap: () {
                      mapBloc.clearPolylines();
                      searchBloc.getPlacesByGJson(
                          'assets/Sendero Takuna Base _Mateguadua.geojson');
                    },
                  ),
                ]);
          },
          child: const Icon(
            Icons.map_sharp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
