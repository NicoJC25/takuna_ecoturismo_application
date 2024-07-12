part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

//Evento al seleccionar ruta
class OnRoutesEvent extends SearchEvent {
  final List<dynamic> places;
  const OnRoutesEvent(this.places);
}
