part of 'location_bloc.dart';

//Declaracion de variables necesarias para localizacion
class LocationState extends Equatable {
  final bool followingUser;
  final bool followingRoute;
  final LatLng? startRouteLocation;
  final LatLng? lastUserLocation;

  const LocationState(
      {this.followingUser = false,
      this.followingRoute = false,
      this.startRouteLocation,
      this.lastUserLocation});

  //Copia de las variables
  LocationState copyWith({
    bool? followingUser,
    bool? followingRoute,
    LatLng? startRouteLocation,
    LatLng? lastUserLocation,
  }) =>
      LocationState(
          followingUser: followingUser ?? this.followingUser,
          followingRoute: followingRoute ?? this.followingRoute,
          startRouteLocation: startRouteLocation ?? this.startRouteLocation,
          lastUserLocation: lastUserLocation ?? this.lastUserLocation);

  @override
  List<Object?> get props =>
      [followingUser, lastUserLocation, startRouteLocation];
}
