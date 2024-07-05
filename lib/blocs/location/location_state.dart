part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LatLng? startRouteLocation;

  const LocationState({this.startRouteLocation});

  LocationState copyWith({
    LatLng? startRouteLocation,
  }) =>
      LocationState(
          startRouteLocation: startRouteLocation ?? this.startRouteLocation);

  @override
  List<Object?> get props => [startRouteLocation];
}
