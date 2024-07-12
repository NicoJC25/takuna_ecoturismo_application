part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

//Evento que se trae del location bloc de inicio ruta
class OnStartFollowingRouteEvent extends MapEvent {}

//Evento que se trae del location bloc de inicio seguimiento usuario
class OnStartFollowingUserEvent extends MapEvent {}

//Evento que se trae del location bloc de fin seguimiento usuario
class OnStopFollowingUserEvent extends MapEvent {}

//Evento cuando se inicia el mapa
class OnMapInitializedEvent extends MapEvent {
  final GoogleMapController controller;
  const OnMapInitializedEvent(this.controller);
}

//Evento cuando se selecciona una ruta
class OnRouteSelectedEvent extends MapEvent {
  final String selectedRoute;
  const OnRouteSelectedEvent(this.selectedRoute);
}

//Evento para los minutos de cada ruta
class SelectedMinutesMarkerEvent extends MapEvent {
  final String minutesSelectedRoute;
  const SelectedMinutesMarkerEvent(this.minutesSelectedRoute);
}

//Evento para los kilometros de cada ruta
class SelectedKilometersEvent extends MapEvent {
  final String kilometersSelectedRoute;
  const SelectedKilometersEvent(this.kilometersSelectedRoute);
}

//Evento para dibujar polylines
class DisplayPolylinesEvent extends MapEvent {
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  const DisplayPolylinesEvent(this.polylines, this.markers);
}
