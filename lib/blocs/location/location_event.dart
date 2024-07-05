part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnNewRouteLocationEvent extends LocationEvent {
  final LatLng newLocation;

  const OnNewRouteLocationEvent(this.newLocation);
}

class OnStartFollowingRoute extends LocationEvent {}

class OnEndFollowingRoute extends LocationEvent {}
