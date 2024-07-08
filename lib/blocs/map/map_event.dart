part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnStartFollowingRouteEvent extends MapEvent {}

class OnStopFollowingRouteEvent extends MapEvent {}

class OnStartFollowingUserEvent extends MapEvent {}

class OnStopFollowingUserEvent extends MapEvent {}

class OnMapInitializedEvent extends MapEvent {
  final GoogleMapController controller;
  const OnMapInitializedEvent(this.controller);
}

class UpdateUserPolylineEvent extends MapEvent {
  final List<LatLng> userLocation;
  const UpdateUserPolylineEvent(this.userLocation);
}

class OnToggleUserRoute extends MapEvent {}

class DisplayPolylinesEvent extends MapEvent {
  final Set<Polyline> polylines;
  const DisplayPolylinesEvent(this.polylines);
}
