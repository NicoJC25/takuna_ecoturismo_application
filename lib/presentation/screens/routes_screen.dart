import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    searchBloc.getPlacesByGJson(
        'assets/coordinates/Sendero base Takuna - La_patria_Corozal Ascenso.geojson');

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final places = state.places;
        return ListView.separated(
          itemBuilder: (context, i) {
            final place = places[i];
            return ListTile(
              title: const Text('Ubicacion 1'),
              leading: const Icon(
                Icons.place_outlined,
                color: Colors.black,
              ),
              onTap: () {},
            );
          },
        );
      },
    );
  }
}
