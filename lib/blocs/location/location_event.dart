part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

//Evento cuando se reconoce una nueva ruta
class OnNewRouteLocationEvent extends LocationEvent {
  final LatLng newRouteLocation;

  const OnNewRouteLocationEvent(this.newRouteLocation);
}

//Evento cuando se reconoce movimiento del usuario
class OnNewUserLocationEvent extends LocationEvent {
  final LatLng newUserLocation;

  const OnNewUserLocationEvent(this.newUserLocation);
}

//Evento cuando se empieza a seguir la ruta
class OnStartFollowingRoute extends LocationEvent {}

//Evento cuando se empieza a seguir el usuario
class OnStartFollowingUser extends LocationEvent {}

//Evento cuando se deja de seguir el usuario
class OnStopFollowingUser extends LocationEvent {}
