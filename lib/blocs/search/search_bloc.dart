import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MapBloc mapBloc;

  //Definicion dle bloc y logica de eventos
  SearchBloc({required this.mapBloc}) : super(const SearchState()) {
    on<OnRoutesEvent>(
        (event, emit) => emit(state.copyWith(places: event.places)));
  }

  //Evento para llamar el evento de cargar rutas, hecho para resumir mas codigo
  Future getPlacesByGJson(String filePath) async {
    final allRoutes = await mapBloc.loadRouteFromGeoJson(filePath);

    add(OnRoutesEvent(allRoutes));
  }
}
