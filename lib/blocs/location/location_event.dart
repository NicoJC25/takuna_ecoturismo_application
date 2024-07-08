part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnNewRouteLocationEvent extends LocationEvent {
  final LatLng newRouteLocation;

  const OnNewRouteLocationEvent(this.newRouteLocation);
}

class OnNewUserLocationEvent extends LocationEvent {
  final LatLng newUserLocation;

  const OnNewUserLocationEvent(this.newUserLocation);
}

class OnStartFollowingRoute extends LocationEvent {}

class OnStopFollowingRoute extends LocationEvent {}

class OnStartFollowingUser extends LocationEvent {}

class OnStopFollowingUser extends LocationEvent {}
