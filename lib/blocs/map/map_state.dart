part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingRoute;

  final Set<Polyline> polylines;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingRoute = true,
    Set<Polyline>? polylines,
  }) : polylines = polylines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingRoute,
    Set<Polyline>? polylines,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingRoute: isFollowingRoute ?? this.isFollowingRoute,
        polylines: polylines ?? this.polylines,
      );

  @override
  List<Object> get props => [isMapInitialized, isFollowingRoute, polylines];
}
