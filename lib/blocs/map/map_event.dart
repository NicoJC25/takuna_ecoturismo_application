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

class OnRouteSelectedEvent extends MapEvent {
  final String selectedRoute;
  const OnRouteSelectedEvent(this.selectedRoute);
}

class SelectedMinutesMarkerEvent extends MapEvent {
  final String minutesSelectedRoute;
  const SelectedMinutesMarkerEvent(this.minutesSelectedRoute);
}

class SelectedKilometersEvent extends MapEvent {
  final String kilometersSelectedRoute;
  const SelectedKilometersEvent(this.kilometersSelectedRoute);
}

class DisplayPolylinesEvent extends MapEvent {
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  const DisplayPolylinesEvent(this.polylines, this.markers);
}
