part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingRoute;
  final bool isFollowingUser;
  final bool showMyRoute;

  final Set<Polyline> polylines;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingRoute = false,
    this.isFollowingUser = true,
    this.showMyRoute = true,
    Set<Polyline>? polylines,
  }) : polylines = polylines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingRoute,
    bool? isFollowingUser,
    bool? showMyRoute,
    Set<Polyline>? polylines,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingRoute: isFollowingRoute ?? this.isFollowingRoute,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        showMyRoute: showMyRoute ?? this.showMyRoute,
        polylines: polylines ?? this.polylines,
      );

  @override
  List<Object> get props => [
        isMapInitialized,
        isFollowingRoute,
        isFollowingUser,
        showMyRoute,
        polylines
      ];
}
