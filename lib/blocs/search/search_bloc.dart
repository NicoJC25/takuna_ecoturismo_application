import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MapBloc mapBloc;

  SearchBloc({required this.mapBloc}) : super(const SearchState()) {
    on<OnRoutesEvent>(
        (event, emit) => emit(state.copyWith(places: event.places)));
  }

  Future getPlacesByGJson(String filePath) async {
    final allRoutes = await mapBloc.loadRouteFromGeoJson(filePath);

    add(OnRoutesEvent(allRoutes));
  }
}
