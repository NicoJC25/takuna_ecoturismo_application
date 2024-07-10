import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';
import 'package:takuna_ecoturismo_application/config/helpers/widgets_to_markers.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  LatLng? mapCenter;

  StreamSubscription<LocationState>? locationStateSubscription;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);

    on<OnStartFollowingUserEvent>(_onStartFollowingUser);
    on<OnStopFollowingUserEvent>(
        (event, emit) => emit(state.copyWith(isFollowingUser: false)));

    //on<UpdateUserPolylineEvent>(_onPolylineUserNewPoint);

    on<OnRouteSelectedEvent>((event, emit) =>
        emit(state.copyWith(selectedRoute: event.selectedRoute)));

    on<SelectedMinutesMarkerEvent>((event, emit) {
      final newState =
          state.copyWith(minutesSelectedRoute: event.minutesSelectedRoute);
      emit(newState);
    });
    on<SelectedKilometersEvent>((event, emit) {
      final newState = state.copyWith(
          kilometersSelectedRoute: event.kilometersSelectedRoute);
      emit(newState);
    });

    on<DisplayPolylinesEvent>((event, emit) => emit(
        state.copyWith(polylines: event.polylines, markers: event.markers)));
    on<OnStartFollowingRouteEvent>(_onStartFollowingRoute);

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (!state.isFollowingUser) return;
      if (locationState.lastUserLocation == null) return;

      //moveCamera(locationState.lastUserLocation!);
    });
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;

    emit(state.copyWith(isMapInitialized: true));
  }

  void _onStartFollowingUser(
      OnStartFollowingUserEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingUser: true));

    if (locationBloc.state.lastUserLocation == null) return;
    moveCamera(locationBloc.state.lastUserLocation!);
  }

  /*void _onPolylineUserNewPoint(
      UpdateUserPolylineEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        color: Colors.black,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: event.userLocation);

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
    }*/

  void clearPolylines() {
    add(const DisplayPolylinesEvent({}, {}));
  }

  void _onStartFollowingRoute(
      OnStartFollowingRouteEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingRoute: true));

    if (locationBloc.state.startRouteLocation == null) return;
    moveCamera(locationBloc.state.startRouteLocation!);
  }

  Future loadRouteFromGeoJson(String filePath) async {
    final Set<Polyline> polylines = {};
    final Set<Marker> markers = {};

    String geoJsonString = await rootBundle.loadString(filePath);
    Map<String, dynamic> geoJson = jsonDecode(geoJsonString);

    List<dynamic> features = geoJson['features'];
    List<LatLng> routeCoordinates = [];

    for (var feature in features) {
      List<dynamic> coordinates = feature['geometry']['coordinates'];
      for (var coord in coordinates) {
        double lat = coord[1];
        double lng = coord[0];
        routeCoordinates.add(LatLng(lat, lng));
      }
    }

    if (state.selectedRoute == 'Sendero La Patria Corozal Ascenso') {
      add(const SelectedMinutesMarkerEvent('154'));
      add(const SelectedKilometersEvent('5'));
    } else if (state.selectedRoute == 'Sendero La Patria Corozal Descenso') {
      add(const SelectedMinutesMarkerEvent('104'));
      add(const SelectedKilometersEvent('4.3'));
    } else if (state.selectedRoute == 'Sendero cancha San Julia') {
      add(const SelectedMinutesMarkerEvent('113'));
      add(const SelectedKilometersEvent('4.6'));
    } else if (state.selectedRoute == 'Sendero Cruz de Dozule') {
      add(const SelectedMinutesMarkerEvent('260'));
      add(const SelectedKilometersEvent('7.8'));
    } else if (state.selectedRoute == 'Sendero Farrallones El Jardin') {
      add(const SelectedMinutesMarkerEvent('70'));
      add(const SelectedKilometersEvent('2.8'));
    } else if (state.selectedRoute == 'Sendero Mateguada') {
      add(const SelectedMinutesMarkerEvent('94'));
      add(const SelectedKilometersEvent('2.8'));
    }

    await Future.delayed(const Duration(milliseconds: 100));

    final customStartMarker =
        await getStartCustomMarker(state.minutesSelectedRoute);

    final customEndMarker =
        await getEndCustomMarker(state.kilometersSelectedRoute);

    polylines.add(Polyline(
      polylineId: PolylineId(filePath),
      width: 5,
      color: Colors.black,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: routeCoordinates,
    ));

    markers.add(Marker(
        anchor: const Offset(0.5, 0.9),
        markerId: MarkerId('routeStart_$filePath'),
        position: routeCoordinates.first,
        icon: customStartMarker));

    markers.add(Marker(
        anchor: const Offset(0.1, 0.5),
        markerId: MarkerId('routeEnd_$filePath'),
        position: routeCoordinates.last,
        icon: customEndMarker));

    add(DisplayPolylinesEvent(polylines, markers));
    moveCamera(LatLng(polylines.first.points.first.latitude,
        polylines.first.points.first.longitude));

    return features;
  }

  void getRouteName(String selectedRoute) {
    add(OnRouteSelectedEvent(selectedRoute));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
