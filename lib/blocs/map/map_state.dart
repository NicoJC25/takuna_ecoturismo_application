part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingRoute;
  final bool isFollowingUser;
  final bool showMyRoute;
  final String selectedRoute;
  final String minutesSelectedRoute;
  final String kilometersSelectedRoute;

  final Set<Polyline> polylines;
  final Set<Marker> markers;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingRoute = false,
    this.isFollowingUser = true,
    this.showMyRoute = true,
    this.selectedRoute = '',
    this.minutesSelectedRoute = '',
    this.kilometersSelectedRoute = '',
    Set<Polyline>? polylines,
    Set<Marker>? markers,
  })  : polylines = polylines ?? const {},
        markers = markers ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingRoute,
    bool? isFollowingUser,
    bool? showMyRoute,
    String? selectedRoute,
    String? minutesSelectedRoute,
    String? kilometersSelectedRoute,
    Set<Polyline>? polylines,
    Set<Marker>? markers,
  }) =>
      MapState(
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          isFollowingRoute: isFollowingRoute ?? this.isFollowingRoute,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          showMyRoute: showMyRoute ?? this.showMyRoute,
          selectedRoute: selectedRoute ?? this.selectedRoute,
          minutesSelectedRoute:
              minutesSelectedRoute ?? this.minutesSelectedRoute,
          kilometersSelectedRoute:
              kilometersSelectedRoute ?? this.kilometersSelectedRoute,
          polylines: polylines ?? this.polylines,
          markers: markers ?? this.markers);

  @override
  List<Object> get props => [
        isMapInitialized,
        isFollowingRoute,
        isFollowingUser,
        showMyRoute,
        selectedRoute,
        minutesSelectedRoute,
        kilometersSelectedRoute,
        polylines,
        markers
      ];
}
