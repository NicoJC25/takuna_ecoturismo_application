import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

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

    on<DisplayPolylinesEvent>(
        (event, emit) => emit(state.copyWith(polylines: event.polylines)));
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
    add(const DisplayPolylinesEvent({}));
  }

  void _onStartFollowingRoute(
      OnStartFollowingRouteEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingRoute: true));

    if (locationBloc.state.startRouteLocation == null) return;
    moveCamera(locationBloc.state.startRouteLocation!);
  }

  Future loadRouteFromGeoJson(String filePath) async {
    final Set<Polyline> polylines = {};

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

    polylines.add(Polyline(
      polylineId: PolylineId(filePath),
      width: 5,
      color: Colors.black,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: routeCoordinates,
    ));

    add(DisplayPolylinesEvent(polylines));
    moveCamera(LatLng(polylines.first.points.first.latitude,
        polylines.first.points.first.longitude));

    return features;
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
